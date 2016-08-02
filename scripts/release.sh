#!/bin/bash

# script for creating a zip and tarball for inclusion in node

unset CDPATH

set -e

rm -rf release *.tgz || true
mkdir release
node ./cli.js pack --loglevel error >/dev/null
mv *.tgz release
cd release
tar xzf *.tgz

mkdir unity_packages
mv package unity_packages/npm

# make the zip for windows users
cp unity_packages/npm/bin/*.cmd .
zipname=npm-$(node ../cli.js -v).zip
zip -q -9 -r -X "$zipname" *.cmd unity_packages

# make the tar for node's deps
cd unity_packages
tarname=npm-$(node ../../cli.js -v).tgz
tar czf "$tarname" npm

cd ..
mv "unity_packages/$tarname" .

rm -rf *.cmd
rm -rf unity_packages

echo "release/$tarname"
echo "release/$zipname"
