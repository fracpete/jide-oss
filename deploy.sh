#!/bin/bash

if [ "$1" = "" ]
then
  echo
  echo "The first argument needs to be the version to deploy to Maven Central"
  echo "(i.e., the sub-directory)."
  echo
  exit 1
fi

if [ "$1" = "-h" ] || [ "$1" = "--help" ]
then
  echo
  echo "Deploys a patched jide-oss version to Maven Central"
  echo 
  echo "usage: deploy.sh VERSION"
  echo
  echo "The VERSION corresponds to a sub-directory."
  echo
  exit 0
fi

if [ ! -d "$1" ]
then
  echo
  echo "Version sub-directory does not exist: $1"
  echo
  exit 2
fi

cd $1
$HOME/programs/apache-maven-3.5.4/bin/mvn org.apache.maven.plugins:maven-gpg-plugin:1.4:sign-and-deploy-file \
      -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
      -DrepositoryId=sonatype-nexus-staging \
      -Dfile=./jide-oss-$1.jar \
      -DpomFile=./jide-oss-$1.pom \
      -Dsources=./jide-oss-$1-sources.jar \
      -Djavadoc=./jide-oss-$1-javadoc.jar

