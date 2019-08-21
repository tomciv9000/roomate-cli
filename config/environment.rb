require 'bundler'
Bundler.require 

require 'open-uri'

DB = {
  :connection => SQLite3::Database.new("db/room-development.sqlite")
}


require_all 'lib'