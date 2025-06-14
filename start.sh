#!/bin/bash
set -euxo pipefail

source /opt/venv/bin/activate

# Run Odoo, and capture output & errors to a log file
odoo --config=odoo.conf --addons-path=custom_purchase,base_accounting_kit,base_account_budget >> /tmp/odoo.log 2>&1 || true

# Keep container alive so you can inspect logs interactively if needed
tail -f /tmp/odoo.log
