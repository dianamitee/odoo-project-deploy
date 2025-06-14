#!/bin/bash

# Activate venv (Railway puts it here)
source /opt/venv/bin/activate

# Start Odoo using your config and custom addons
odoo --config=odoo.conf \
     --addons-path=custom_purchase,base_accounting_kit,base_account_budget
