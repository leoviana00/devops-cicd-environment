node {

  stage('Environment Variables') {
    // cleanWs()
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
    def pom = readMavenPom file: ''
    // configFileProvider([configFile(fileId: 'SonarQubeFile', variable: 'SONAR_TEMPLATE')]) {
    //     sh "chmod +x ${SONAR_TEMPLATE}"
    //     sh "/bin/bash ${SONAR_TEMPLATE} ${pom.artifactId}_${BRANCH} ${pom.version} sonar-project.properties"
    // }
    def scannerHome = tool 'SonarQube Scanner';
    withSonarQubeEnv() {
      // sh "${scannerHome}/bin/sonar-scanner"
        sh "${scannerHome}/bin/sonar-scanner -e "+
        "-Dsonar.projectKey=${ARTIFACT} "+
        "-Dsonar.projectVersion=${pom.version} "+
        "-Dsonar.language=java "+
        "-Dsonar.java.binaries=target "+
        "-Dsonar.sources=src/main/java "+
        "-Dsonar.tests=src/test/java "+
        "-Dsonar.junit.reportsPath=target/surefire-reports "+
        "-Dsonar.surefire.reportsPath=target/surefire-reports "+
        "-Dsonar.coverage.jacoco.xmlReportPaths=target/site/jacoco/jacoco.xml "+
        "-Dsonar.java.coveragePlugin=jacoco "+
        "-Dsonar.exclusions=.mvn/**,mvn* "+
        "-Dsonar.sourceEncoding=UTF-8"
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