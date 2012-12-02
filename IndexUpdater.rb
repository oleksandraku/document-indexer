#Johann Steinbrecher
#Sourcery
#Nov. 2012

require 'rsolr'

class IndexUpdater

  def initialize( url )
	@solr = RSolr.connect :url => url
  end

  def perform_update( text, update, vendor)
	@solr.add(type: ['Update', 'ActiveRecord::Base'], class_name: 'Update', id: "Update #{update}", text_textp: text, vendor_id_i: vendor)
	@solr.commit
	response = @solr.get 'select', :params => {:q => "*:*"}
  end

end
