node {

  stage('Environment Variables') {
    env.ARTIFACT = 'demo'
    env.REPOSITORY = 'ssh://git@192.168.10.10:2022/jenkins/demo.git' 
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
  
}