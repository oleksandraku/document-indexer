require 'rubygems'
require 'bundler'

Bundler.require

require './lib/index'
run Sinatra::Application
