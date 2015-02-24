# Gems
require 'rack'
require 'rack-routing'

# App
require_relative 'app'
require_relative 'builder'

# I18n.enforce_available_locales = true

ROUTES = Router.load_routes
