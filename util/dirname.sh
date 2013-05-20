#!/bin/bash

FIRST=`echo $0 | cut -d\/ -f1`
if [ "a$FIRST" = "a" ]
then
	echo `dirname $0`
else
	PWD=`pwd`
	PWD=`dirname "$PWD/$0"`
	PWD=`dirname "$PWD/../Makefile"`
	echo $PWD
fi
