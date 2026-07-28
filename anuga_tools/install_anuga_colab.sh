#!/bin/bash
#
# Install ANUGA and its dependencies in a Google Colab environment.
#
# Failures are no longer suppressed: the script stops on the first error so a
# broken install is obvious rather than silently printing "(4) Ready to go".

set -euo pipefail

cd /content

echo "(1) Install Dependencies"

echo "   Install pytest via pip"
pip -q install pytest

echo "   Install gitpython via pip"
pip -q install gitpython

echo "   Install pyproj via pip"
pip -q install pyproj

echo "   Install netcdf4 via pip"
pip -q install netCDF4

echo "   Install meshpy via pip"
pip -q install meshpy

echo "   Install dill via pip"
pip -q install dill

echo "   Install pymetis via pip"
pip -q install pymetis

echo "   Install affine via pip"
pip -q install affine

echo "   Install utm via pip"
pip -q install utm

echo "(2) Install anuga via pip"
# Floor of 3.3.9: the cp312 wheel of 3.3.8 (the one Colab's Python picks) was
# built with -march=native on an AVX-512 machine, so "import anuga" died with
# SIGILL (Illegal instruction, core dumped) on Colab VMs. 3.3.9 wheels are
# built for baseline x86-64 again.
pip -q install "anuga>=3.3.9"

echo "(3) Verify anuga import"
python -c "import anuga; print('anuga', anuga.__version__)"

echo "(4) Ready to go"
