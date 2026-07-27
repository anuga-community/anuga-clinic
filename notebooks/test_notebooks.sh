#!/bin/bash
#
# Execute every clinic notebook end-to-end and fail loudly if any cell raises.
#
# `set -e` + `--execute` means a single failing cell aborts the run with a
# non-zero exit code, so CI (and humans) actually notice a broken notebook.
#
# If necessary first install appropriate extensions:
#   conda install jupyter_contrib_nbextensions

set -euo pipefail

cd "$(dirname "$0")"

for nb in notebook1 notebook2 notebook3 notebook4 notebook5; do
    echo "=== Executing ${nb}.ipynb ==="
    jupyter nbconvert "${nb}.ipynb" --to notebook --execute \
        --output "${nb}.nbconvert.ipynb" \
        --ExecutePreprocessor.timeout=1800
done

echo "All notebooks executed successfully."
