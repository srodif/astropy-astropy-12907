#!/bin/bash
set -euxo pipefail

# SWE-bench instance setup script (git operations removed)
# The repository code is already present in this directory

#!/bin/bash
set -euxo pipefail
chmod -R 777 /testbed
cd /testbed
source /opt/miniconda3/bin/activate
conda activate testbed
echo "Current environment: $CONDA_DEFAULT_ENV"
sed -i 's/requires = \["setuptools",/requires = \["setuptools==68.0.0",/' pyproject.toml
python -m pip install -e .[test] --verbose
git config --global user.email setup@swebench.config
git config --global user.name SWE-bench
git commit --allow-empty -am SWE-bench