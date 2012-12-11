#Johann Steinbrecher
#Sourcery
#Nov. 2012

require 'airbrake'

Airbrake.configure do |config|
  config.api_key = ENV['AIRBRAKE_API_KEY']
  config.environment_name = ENV['RACK_ENV']  #airbrake does not simply assume your environment name
end

use Airbrake::Rack

