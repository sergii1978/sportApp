# app.rb
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/content_for'
require 'sinatra/namespace'
require 'i18n'
require 'i18n/backend/fallbacks'
require 'tilt/erb'
require 'fileutils'
require 'securerandom'
require 'yaml'

enable :sessions


# Localization setup
# I18n::Backend::Simple.include I18n::Backend::Fallbacks
# I18n.load_path += Dir['./locales/*.yml']
# I18n.backend.load_translations
# I18n.default_locale = :en

# before do
#   I18n.locale = session[:locale] || I18n.default_locale
# end

# helpers do
#   def t(key)
#     I18n.t(key)
#   end
# end

# Admin password for simplicity
ADMIN_PASSWORD = "admin123"

# Root route
get '/' do
  erb :index
end

get '/about'     do erb :about     end
get '/services'  do erb :services  end
get '/trainers'  do erb :trainers  end
get '/schedule'  do erb :schedule  end
get '/contact'   do erb :contact   end

# Gallery
get '/gallery' do
  @images = Dir['public/uploads/*'].map { |f| f.sub('public/', '') }
  @comments = load_comments
  erb :gallery
end

post '/upload' do
  halt(403, 'Not authorized') unless session[:admin]
  file = params[:image][:tempfile]
  name = params[:image][:filename]
  path = "public/uploads/#{SecureRandom.hex}_#{name}"
  FileUtils.copy(file.path, path)
  redirect '/gallery'
end

# Comments
post '/comments' do
  comment = {
    author: params[:author],
    body: params[:body],
    timestamp: Time.now
  }
  comments = load_comments
  comments << comment
  File.write('comments.yml', YAML.dump(comments))
  redirect '/gallery'
end

def load_comments
  File.exist?('comments.yml') ? YAML.load_file('comments.yml') : []
end

# Admin
get '/admin/login' do
  erb :admin_login
end

post '/admin/login' do
  if params[:password] == ADMIN_PASSWORD
    session[:admin] = true
    redirect '/'
  else
    @error = t(:invalid_password)
    erb :admin_login
  end
end

get '/admin/logout' do
  session[:admin] = nil
  redirect '/'
end

# Locale switching
get '/locale/:lang' do
  session[:locale] = params[:lang].to_sym
  redirect back
end

not_found do
  status 404
  erb :not_found
end

require 'sequel'

# Підключаємося до бази
DB = Sequel.sqlite('database.db')

# Виконуємо міграції
# Sequel.extension :migration, :core_extensions

# Sequel::Migrator.run(DB, 'db/migrations')

# Створення дефолтного адміністратора
# if ADMINS.count == 0
#   ADMINS.insert(username: 'admin', password: 'password')
# end
