#!/bin/bash

cd /content

echo "(1a) Install nose via pip"
pip -q install nose  > /dev/null 2>&1 

echo "(1b) Install via gitpython pip"
pip -q install gitpython  > /dev/null 2>&1 

echo "(1c) Install via pyproj pip"
pip -q install pyproj  > /dev/null 2>&1 

echo "(2) Install gdal via apt-get"
apt-get -q -y install python-gdal gdal-bin  > /dev/null 2>&1 

echo "(3) Install netcdf4 via apt-get"
apt-get -q -y install python-netcdf4  > /dev/null 2>&1 

echo "(4) Download anuga_core github repository"
git clone --quiet https://github.com/anuga-community/anuga_core.git  > /dev/null 2>&1 

echo "(5) Install anuga"

cd anuga_core
python setup.py --quiet install  > /dev/null 2>&1 
cd ../

echo "(6) Ready to go"
