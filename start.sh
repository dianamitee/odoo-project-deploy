#!/bin/bash

# Activate venv just in case
source /opt/venv/bin/activate

# Start Odoo using your config file
odoo --config=odoo.conf --addons-path=custom_purchase,base_accounting_kit,base_account_budget
