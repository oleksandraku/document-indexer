#Johann Steinbrecher
#Sourcery
#Nov. 2012

require 'rsolr'
SOLR_URL = 'http://localhost:8983/solr'

SOLR = RSolr.connect url: SOLR_URL

class IndexUpdater
  class << self
    def perform_update( text, update, vendor)      
	    SOLR.add(type: ['Update', 'ActiveRecord::Base'], class_name: 'Update', id: "Update #{update}", text_textp: text, vendor_id_i: vendor)
	    SOLR.commit	
    end
  end
end
