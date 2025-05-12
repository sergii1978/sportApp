require 'bundler/setup'
Bundler.require

require './app'

use Rack::Session::Cookie, secret: 'super_secret_key'
use Rack::Locale

run Sinatra::Application
