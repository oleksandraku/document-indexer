#Johann Steinbrecher
#Sourcery
#Nov. 2012

require 'rsolr'
SOLR_URL = ENV['WEBSOLR_URL'] ||
  case ENV['RACK_ENV']
  when 'development'
    'http://localhost:8982/solr'
  when 'test'
    'http://localhost:8981/solr'
  else
    raise "No solr url known for #{ENV['RACK_ENV']}"
  end

SOLR = RSolr.connect url: SOLR_URL

class IndexUpdater
  class << self
    def perform_update( text, attachment_id)
      SOLR.add(type: ['Post', 'ActiveRecord::Base'], class_name: 'Post', id: attachment_id, text_textp: text)
      SOLR.commit
    end
  end
end
