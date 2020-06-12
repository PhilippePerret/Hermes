# encoding: UTF-8
require 'readline'
require 'tty-prompt'
Q = TTY::Prompt.new

SANDBOX = false

require './_lib/data/secret/mysql.rb' # => DATA_MYSQL
Dir["./_lib/required/__first/**/*.rb"].each{|m|require m}
Dir["./_lib/required/__then/**/*.rb"].each{|m|require m}
