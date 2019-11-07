#!/bin/bash

hub checkout master
hub release create -a ./${APP_FOLDER}/build/outputs/apk/debug/*.apk -m "${RELEASE_TITLE}" $(date +%Y%m%d%H%M%S) 
