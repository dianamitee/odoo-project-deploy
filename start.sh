#!/bin/bash

# Activate the virtual environment
source /app/.venv/bin/activate

# Start Odoo with config and custom addons
odoo --config=odoo.conf \
     --addons-path=custom_purchase,base_accounting_kit,base_account_budget
