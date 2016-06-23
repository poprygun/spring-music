#!/usr/bin/env bash

cd resource-music-repo
mvn package
mv target/spring-music.war ../output/spring-music.war