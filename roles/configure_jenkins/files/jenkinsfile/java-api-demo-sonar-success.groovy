  node {

  stage('Environment Variables') {
    env.ARTIFACT = 'java-api-demo-sonar-success'
    env.REPOSITORY = 'ssh://git@192.168.10.10:2022/jenkins/java-api-demo-sonar-success.git' 
    env.REPOSITORYGITOPS = 'ssh://git@192.168.10.10:2022/jenkins/gitops-storage.git' 
    env.BRANCH = "master"
  }

  stage('SCM') {
    git(branch: "${BRANCH}", credentialsId: 'GitlabInJenkins', url: "${REPOSITORY}")
  }
  
  stage('Build') {
     sh "mvn -U -B -DskipTests clean package"
  }
  
  stage('Test') {
     sh "mvn test jacoco:report"
     junit allowEmptyResults: true, testResults: 'target/surefire-reports/*.xml'
  }
  
  stage("SonarQube analysis") {
    withSonarQubeEnv() {
       sh 'mvn sonar:sonar'
    }
  }
  
  stage("Quality Gate"){
    timeout(time: 10, unit: 'MINUTES') {
       def qg = waitForQualityGate()
       if (qg.status != 'OK') {
            error "Pipeline aborted due to quality gate failure: ${qg.status}"
       }
    }
  }


  stage ("Docker Build"){
    def pom = readMavenPom file: ''
    def dockerRegistry = '192.168.10.30:5000'
      configFileProvider([configFile(fileId: 'Dockerfile', variable: 'DOCKERFILE')]) {
        withCredentials([usernamePassword(credentialsId: 'RegistryPullSecret', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh "docker login ${dockerRegistry} --username ${USERNAME} --password ${PASSWORD}"
          sh "cp ${DOCKERFILE} Dockerfile"
          sh "docker build -t ${dockerRegistry}/${pom.artifactId}:${pom.version} ." 
          sh "docker build -t ${dockerRegistry}/${pom.artifactId}:latest ."
          sh "docker push ${dockerRegistry}/${pom.artifactId}:${pom.version}"
          sh "docker push ${dockerRegistry}/${pom.artifactId}:latest"
        }
      }
  }

  stage ("Update CD File"){
    		def pom = readMavenPom file: ''
			  dir('gitops-storage') {
			    checkout changelog: true, poll: true, scm: [
					$class: 'GitSCM',
					branches: [[name: "origin/main"]],
					doGenerateSubmoduleConfigurations: false,
					submoduleCfg: [],
					userRemoteConfigs: [[credentialsId: 'GitlabInJenkins', url: "${REPOSITORYGITOPS}"]]
					]
					sshagent(['GitlabInJenkins']) {
						sh label: '', script: """
						mkdir -p "cd-files/main/${pom.artifactId}"
						cp  ../deployment.yaml "cd-files/main/${pom.artifactId}/deployment.yaml"
						git config user.email "jenkins@gmail.com.br"
						git config user.name "Jenkins"
						git add "cd-files/main/${pom.artifactId}/deployment.yaml"
						git diff --quiet && git diff --staged --quiet || git commit --allow-empty -m "M - Change deployment.yaml ${pom.artifactId}-${pom.version}-main"
						git push -u origin HEAD:main
						"""
          }
        }        
  }
}