require 'sinatra'
require "sinatra/content_for"
require 'sinatra/activerecord'
require 'fileutils'

# Моделі (якщо використовуєте базу даних)
# class Comment < ActiveRecord::Base
#   validates :author, presence: true
#   validates :body, presence: true
# end

# Головна сторінка
get '/' do
  # Можна отримати коментарі з бази даних або з файлу
  @comments = [
    { author: "John", body: "Great gallery!" },
    { author: "Jane", body: "Nice collection of images!" }
  ]

  @images = Dir.glob('public/images/*').select { |f| f.include?('.jpg') || f.include?('.png') }

  erb :index
end

# Сторінка "Про нас"
get '/about' do
  erb :about
end

# Сторінка "Послуги"
get '/services' do
  erb :services
end

# Сторінка "Тренери"
get '/trainers' do
  erb :trainers
end

# Сторінка "Розклад"
get '/schedule' do
  erb :schedule
end

# Сторінка галереї
get '/gallery' do
  @images = Dir.glob('public/images/*').select { |f| f.include?('.jpg') || f.include?('.png') }
  @comments = [
    { author: "John", body: "Amazing!" },
    { author: "Mary", body: "Love the photos!" }
  ]
  erb :gallery
end

# Сторінка контактів
get '/contact' do
  erb :contact
end

# Завантаження зображень (тільки для адміністраторів)
post '/upload' do
  if session[:admin]
    image = params[:image]
    if image && image[:tempfile]
      filename = image[:filename]
      filepath = "public/images/#{filename}"
      FileUtils.mv(image[:tempfile].path, filepath)
      redirect '/gallery'
    else
      "No file selected"
    end
  else
    redirect '/'
  end
end

# Обробка коментарів
post '/comments' do
  author = params[:author]
  body = params[:body]

  # Збереження коментаря в базі даних або в масиві
  # Коментарі зберігаються лише для сесії (для простоти)
  # Якщо у вас є база даних, можете використовувати ActiveRecord
  @comments.push({ author: author, body: body })

  redirect '/gallery'
end

# Вихід з адміністративної панелі
get '/admin/logout' do
  session[:admin] = nil
  redirect '/'
end

# Перемикання теми (світла/темна)
post '/toggle-theme' do
  session[:dark_theme] = !session[:dark_theme]
  redirect request.referrer
end

# Налаштування сесії для адміністратора
before do
  session[:admin] ||= false
end

# Логін адміністратора
get '/admin' do
  erb :admin_login
end

post '/admin/login' do
  # Тестовий логін (наприклад, для простоти)
  if params[:password] == 'adminpassword'
    session[:admin] = true
    redirect '/gallery'
  else
    @error = "Incorrect password"
    erb :admin_login
  end
end
