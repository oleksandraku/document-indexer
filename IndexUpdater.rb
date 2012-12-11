#Johann Steinbrecher
#Sourcery
#Nov. 2012

require 'rsolr'
SOLR_URL = 'http://localhost:8983/solr'

class IndexUpdater

  def initialize 
    @solr = RSolr.connect :url => SOLR_URL
  end

  def perform_update( text, update, vendor)
	  @solr.add(type: ['Update', 'ActiveRecord::Base'], class_name: 'Update', id: "Update #{update}", text_textp: text, vendor_id_i: vendor)
	  @solr.commit	
  end

end
