#!/bin/bash

set -e

SOURCE_PATH=${1}
TRANSFORM_PATH=${2}
OUTPUT_PATH="$SOURCE_PATH/output"

mkdir -p $OUTPUT_PATH

for f in $SOURCE_PATH/*.xml
do
  echo "Transforming $f..."
  saxonb-xslt -s $f -xsl $TRANSFORM_PATH >> $OUTPUT_PATH/${f%.*}-converted.xml
  echo "Transformation of $f is Successful."
done

echo "Finished transformation of set."
