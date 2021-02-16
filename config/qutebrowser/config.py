config.load_autoconfig(False)

config.set('downloads.location.directory', '~/downloads')

config.set('content.geolocation', False)
config.set('content.notifications', False)
config.set('content.ssl_strict', True)

config.set(
    'qt.environ',
    {
        'QT_SCALE_FACTOR_ROUNDING_POLICY': 'PassThrough',
        'QT_ENABLE_HIGHDPI_SCALING': '1',
    }
)
