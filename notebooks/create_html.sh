#!/bin/bash
#
# Convert the executed notebooks (produced by test_notebooks.sh) to HTML.
# Run test_notebooks.sh first so the *.nbconvert.ipynb files exist.

set -euo pipefail

cd "$(dirname "$0")"

for nb in notebook1 notebook2 notebook3 notebook4 notebook5; do
    echo "=== Converting ${nb}.nbconvert.ipynb to HTML ==="
    jupyter nbconvert "${nb}.nbconvert.ipynb" --to html
done

echo "All notebooks converted to HTML."
