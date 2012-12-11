#Johann Steinbrecher
#Sourcery
#Nov. 2012

require 'rsolr'
SOLR_URL = ENV['WEBSOLR_URL'] || 'http://localhost:8983/solr'

SOLR = RSolr.connect url: SOLR_URL

class IndexUpdater
  class << self
    def perform_update( text, post_id, vendor_id)      
	    SOLR.add(type: ['Post', 'ActiveRecord::Base'], class_name: 'Post', id: "Post #{post_id}", text_textp: text, vendor_id_i: vendor_id)
	    SOLR.commit	
    end
  end
end
