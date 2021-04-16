#!/bin/bash

VERSIONS="8 11 14"

for VERSION in ${VERSIONS}
do
    JDK_URL="https://api.azul.com/zulu/download/community/v1.0/bundles/latest/binary/?jdk_version=${VERSION}&ext=tar.gz&os=linux&arch=x86&hw_bitness=64"
    OUTFILE="zulu${VERSION}.tar.gz"
    curl -L ${JDK_URL} -o ${OUTFILE}
done
