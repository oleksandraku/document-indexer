require 'spec_helper'
require 'rsolr'
require 'json'

TEST_DOC = "http://localhost:9292/emailattachment.pdf"
TERM = "Puree"
INDEX_ID = -1

describe 'Document Indexer' do
  def app
    Sinatra::Application
  end

  it "Doc parser is" do    
    get "/attachment/#{INDEX_ID}/document/#{ CGI::escape TEST_DOC }"
    last_response.should be_ok
  end
  
  it "Search term" do
    json = JSON.parse ( SOLR.get 'select', :params => {:q => "text_textp:#{TERM}", :wt => :json} )
    results = json["response"]["docs"]
    results.length.should_not eql (0)
    results.each do | item |
      item["text_textp"][0].should include(TERM)
    end
    SOLR.delete_by_id INDEX_ID
    SOLR.commit
  end  
  
end
