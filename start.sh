#!/bin/bash
set -e

# Create venv if not already active
if [ ! -d "/app/.venv" ]; then
  python3 -m venv /app/.venv
fi

source /app/.venv/bin/activate

# Install Odoo 16 from GitHub (only if not installed)
if [ ! -d "/app/odoo" ]; then
  git clone --depth 1 --branch 16.0 https://github.com/odoo/odoo.git /app/odoo
fi

# Install Python dependencies
pip install -r /app/odoo/requirements.txt

# Run Odoo
python3 /app/odoo/odoo-bin --config=odoo.conf \
    --addons-path=custom_purchase,base_accounting_kit,base_account_budget
