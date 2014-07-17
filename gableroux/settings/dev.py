from .base import *

DEBUG = True

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

INSTALLED_APPS += (
    'debug_toolbar',
)

# BASE_URL required fo  r notification emails
BASE_URL = 'http://localhost:8111'

try:
	from .local import *
except ImportError:
	pass
