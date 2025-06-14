#!/bin/bash
set -euxo pipefail

# Check if venv exists and activate it
VENV_PATH="/opt/venv"
if [ -f "$VENV_PATH/bin/activate" ]; then
  echo "Activating virtual environment at $VENV_PATH"
  source "$VENV_PATH/bin/activate"
else
  echo "Virtual environment not found at $VENV_PATH"
  exit 1
fi

# Check if 'odoo' command is available
if ! command -v odoo &> /dev/null; then
  echo "Error: 'odoo' command not found after activating venv"
  exit 1
fi

# Print Odoo version for sanity
odoo --version

# Start Odoo with config and addons
odoo --config=odoo.conf --addons-path=custom_purchase,base_accounting_kit,base_account_budget
