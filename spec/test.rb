#Johann Steinbrecher
#Sourcery
#Santa Clara 2012

require File.dirname(__FILE__) +'/../lib/index'  
require 'rspec'
require 'rack/test'

set :environment, :test

describe 'Document Indexer' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "Doc parser is" do
    get '/vendor/1/update/3/document/http%3A%2F%2Fwww.hansman.net%2Ftest_doc.pdf'
    last_response.should be_ok
  end
end
