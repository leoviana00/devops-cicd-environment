#! /bin/bash
projectName=$1
projectVersion=$2
outputPath=$3
cat > "$outputPath" <<-EOF
sonar.projectKey=$projectName
sonar.projectVersion=$projectVersion
sonar.language=java
sonar.sources=src/main/java
sonar.tests=src/test/java
sonar.junit.reportsPath=target/surefire-reports
sonar.surefire.reportsPath=target/surefire-reports
sonar.jacoco.reportPath=target/jacoco.exec
sonar.java.binaries=target
sonar.java.coveragePlugin=jacoco
sonar.exclusions=.mvn/**,mvn*
sonar.sourceEncoding=UTF-8
EOF