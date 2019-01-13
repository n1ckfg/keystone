#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

cd $DIR

cp /Applications/Processing/Processing3.app/Contents/Java/core.jar lib/core.jar
cp ../library/jai_core.jar lib/jai_core.jar

javac -cp lib/\* deadpixel/keystone/*.java
mv deadpixel/keystone/*.class build/deadpixel/keystone/
cd build
jar cvfm ../../library/keystone.jar manifest.txt deadpixel/keystone/*.class

cd ..
rm lib/core.jar
rm lib/jai_core.jar

