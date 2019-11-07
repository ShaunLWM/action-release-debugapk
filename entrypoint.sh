#!/bin/bash

hub checkout master
VERSION_NAME=`grep -oP 'versionName "\K(.*?)(?=")' ./${APP_FOLDER}/build.gradle`
hub release create -a ./${APP_FOLDER}/build/outputs/apk/debug/app-debug.apk -m "${RELEASE_TITLE} - ${VERSION_NAME}" $(date +%Y%m%d%H%M%S) 