#!/bin/bash

FILETOCOPY=$1
DESTDIR=$2

PREFIX=`head -n1 "${FILETOCOPY}" | awk '{print $4}'`
APPNAME=`head -n1 "${FILETOCOPY}" | awk '{print $5}'`

mkdir -p "${DESTDIR}/${APPNAME}/${PREFIX}"
cp "${FILETOCOPY}" "${DESTDIR}/${APPNAME}/${PREFIX}"
