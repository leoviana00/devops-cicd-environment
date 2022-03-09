#! /bin/bash
projectName=$1
projectVersion=$2
outputPath=$3
appName() {
  echo "$(find . -name *.jar)" | cut -d / -f 2
}
cd target
rm -rf m2
java -jar $(appName) --thin.root=m2 --thin.dryrun
cd ..
cat > "$outputPath" <<-EOF
sonar.projectKey=$projectName
sonar.projectVersion=$projectVersion
sonar.language=java
sonar.sources=src/main/java
sonar.tests=src/test/java
sonar.junit.reportsPath=target/surefire-reports
sonar.surefire.reportsPath=target/surefire-reports
sonar.coverage.jacoco.xmlReportPaths=target/site/jacoco/jacoco.xml
sonar.java.binaries=target
#sonar.java.libraries=target/m2/repository/**/*.jar
sonar.java.libraries=$HOME/.m2/repository/**/*.jar
sonar.java.coveragePlugin=jacoco
sonar.exclusions=.mvn/**,mvn*
sonar.sourceEncoding=UTF-8
EOF
