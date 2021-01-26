#!/bin/bash

VERSIONS="8 11 14"

for VERSION in ${VERSIONS}
do
    JDK_URL="https://api.adoptopenjdk.net/v3/binary/latest/${VERSION}/ga/linux/x64/jdk/hotspot/normal/adoptopenjdk"
    OUTFILE="adoptium${VERSION}.tar.gz"
    curl -L ${JDK_URL} -o ${OUTFILE}
done
