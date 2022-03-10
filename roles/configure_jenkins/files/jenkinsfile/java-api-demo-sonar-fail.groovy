node {

  stage('Environment Variables') {
    env.ARTIFACT = 'java-api-demo-sonar-fail'
    env.REPOSITORY = 'ssh://git@192.168.10.10:2022/jenkins/java-api-demo-sonar-fail.git' 
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
  
  stage("build & SonarQube analysis") {
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
  
}