config.load_autoconfig(False)

config.set('auto_save.session', True)
config.set('content.geolocation', False)
config.set('content.notifications.enabled', False)
config.set('content.register_protocol_handler', True, '*.calendar.google.com')
config.set('content.pdfjs', True)
config.set('content.unknown_url_scheme_policy', 'allow-all', '*.pop.com')
config.set('content.unknown_url_scheme_policy', 'allow-all', '*.zoom.us')
config.set('content.unknown_url_scheme_policy', 'allow-all', '*.slack.com')
config.set('content.tls.certificate_errors', 'ask-block-thirdparty')
config.set('downloads.location.directory', '~/downloads')
config.set(
    'qt.environ',
    {
        'QT_SCALE_FACTOR_ROUNDING_POLICY': 'PassThrough',
        'QT_ENABLE_HIGHDPI_SCALING': '1',
    }
)
