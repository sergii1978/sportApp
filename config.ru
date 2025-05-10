# config.ru
require './app'
run Sinatra::Application

# I18n.load_path += Dir[File.join('config', 'locales', '*.yml')]
# I18n.default_locale = :uk
