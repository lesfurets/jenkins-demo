#!/bin/bash
# Copies all necessaries artifact from any local cache.
# Useful offline
TARGET_DIR="~/dev/jenkins-home/.m2/repository"

function copyFile() {
  filePath="$1"
  mkdir -p "$TARGET_DIR/$(dirname $filePath)"
  source=`locate $(basename "${filePath}") | head -1`
  cp "${source}" "${TARGET_DIR}/$filePath"
}

function copyArtifact() {
  echo $1
  copyFile $1.pom
  copyFile $1.jar
}

copyArtifact "org/codehaus/groovy/groovy-all/2.4.7/groovy-all-2.4.7"
copyArtifact "org/spockframework/spock-core/1.0-groovy-2.4/spock-core-1.0-groovy-2.4"
copyArtifact "junit/junit/4.12/junit-4.12"
copyArtifact "com/lesfurets/jenkins-pipeline-unit/0.11/jenkins-pipeline-unit-0.11"
copyArtifact "org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3"
copyFile "org/hamcrest/hamcrest-parent/1.3/hamcrest-parent-1.3.pom"
copyArtifact "com/cloudbees/groovy-cps/1.11/groovy-cps-1.11"
copyArtifact "org/assertj/assertj-core/3.4.1/assertj-core-3.4.1"
copyFile "com/cloudbees/cloudbees-oss-parent/6/cloudbees-oss-parent-6.pom"
copyFile "org/assertj/assertj-parent-pom/2.1.4/assertj-parent-pom-2.1.4.pom"
copyArtifact "com/google/guava/guava/11.0.1/guava-11.0.1"
copyFile "com/google/guava/guava-parent/11.0.1/guava-parent-11.0.1.pom"
copyFile "org/sonatype/oss/oss-parent/7/oss-parent-7.pom"
copyArtifact "com/google/code/findbugs/jsr305/1.3.9/jsr305-1.3.9"
copyArtifact "org/jacoco/org.jacoco.agent/0.7.7.201606060606/org.jacoco.agent-0.7.7.201606060606"
copyArtifact "org/jacoco/org.jacoco.build/0.7.7.201606060606/org.jacoco.build-0.7.7.201606060606"
