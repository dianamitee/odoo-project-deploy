{
    'name': 'Custom Purchase',
    'version': '1.0',
    'depends': ['purchase'],
    'author': '',
    'category': 'Purchases',
    'data': [
        'security/security.xml',
        'security/ir.model.access.csv',
        'data/mail_template.xml',
        'views/purchase_order_views.xml',
    ],
    'installable': True,
}
