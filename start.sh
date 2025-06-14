#!/bin/bash

# Activate the virtual environment
source /opt/venv/bin/activate

# Run Odoo
odoo --config=odoo.conf \
     --addons-path=custom_purchase,base_accounting_kit,base_account_budget
