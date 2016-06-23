#!/usr/bin/env bash

#!/bin/sh

cd resource-music-repo
./mvnw package
mv target/*.war ../output/spring-music.war