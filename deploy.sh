#!/bin/bash

VERSION=3.6.18.1
mvn org.apache.maven.plugins:maven-gpg-plugin:1.4:sign-and-deploy-file \
      -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ \
      -DrepositoryId=sonatype-nexus-staging \
      -Dfile=./jide-oss-$VERSION.jar \
      -DpomFile=./jide-oss-$VERSION.pom \
      -Dsources=./jide-oss-$VERSION-sources.jar \
      -Djavadoc=./jide-oss-$VERSION-javadoc.jar
