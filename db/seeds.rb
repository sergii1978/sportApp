require 'sqlite3'

db = SQLite3::Database.new 'db/site.db'

db.execute("INSERT INTO articles (title, content) VALUES (?, ?)",
           ["Як правильно качати прес", "Щоб мати прес, потрібно..."])
