require 'rake'
require 'sequel'
require 'fileutils'

DB = Sequel.sqlite('database.db')

namespace :db do
  desc 'Створити таблиці'
  task :create do
    DB.create_table? :images do
      primary_key :id
      String :path
    end

    DB.create_table? :comments do
      primary_key :id
      String :author
      String :body
    end

    DB.create_table? :admins do
      primary_key :id
      String :username
      String :password
    end

    puts 'Базу даних створено.'
  end

  desc 'Скинути базу даних'
  task :drop do
    FileUtils.rm_f('database.db')
    puts 'Базу даних видалено.'
  end

  desc 'Створити базу з дефолтним адміном'
  task :seed do
    DB[:admins].insert(username: 'admin', password: 'password') unless DB[:admins].first
    puts 'Додано дефолтного адміністратора.'
  end
end
