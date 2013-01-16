ENV['RACK_ENV'] = "development"

require File.join(File.dirname(__FILE__), '/../lib/index')
require 'rspec'
require 'rack/test'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end
