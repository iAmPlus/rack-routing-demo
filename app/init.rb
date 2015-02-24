# Gems
require 'rack'
require 'rack/routing'

# App
require_relative 'app'
require_relative 'builder'
require_relative 'request'

# Ruby modules
require 'json'

# I18n.enforce_available_locales = true

ROUTES_FILE = 'config/routes.txt'
ROUTES = Router.load_routes
