from odoo import models, fields, api
from odoo.exceptions import UserError

class PurchaseOrder(models.Model):
    _inherit = 'purchase.order'

    state = fields.Selection(selection_add=[
        ('manager_approval', 'Waiting Manager Approval'),
        ('finance_approval', 'Waiting Finance Approval'),
    ])

    def button_custom_approve(self):
        for order in self:
            if order.amount_total <= 5000:
                order.button_confirm()
            elif order.amount_total <= 20000:
                order.write({'state': 'manager_approval'})
                template = self.env.ref('custom_purchase_approval.email_template_manager_approval')
                template.send_mail(order.id, force_send=True)
            else:
                order.write({'state': 'finance_approval'})
                template = self.env.ref('custom_purchase_approval.email_template_finance_approval')
                template.send_mail(order.id, force_send=True)

    def button_manager_approve(self):
        for order in self:
            if order.state != 'manager_approval':
                raise UserError("Not in Manager Approval state.")
            order.button_confirm()

    def button_finance_approve(self):
        for order in self:
            if order.state != 'finance_approval':
                raise UserError("Not in Finance Approval state.")
            order.button_confirm()
