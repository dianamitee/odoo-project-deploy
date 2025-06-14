#!/bin/bash
set -e

# Try installing git at runtime (just for debug)
apt-get update && apt-get install -y git

# Now your usual script here...
if [ ! -d "/app/.venv" ]; then
  python3 -m venv /app/.venv
fi
source /app/.venv/bin/activate

if [ ! -d "/app/odoo" ]; then
  git clone --depth 1 --branch 16.0 https://github.com/odoo/odoo.git /app/odoo
fi

pip install -r /app/odoo/requirements.txt

python3 /app/odoo/odoo-bin --config=odoo.conf --addons-path=custom_purchase,base_accounting_kit,base_account_budget
