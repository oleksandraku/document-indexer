#Johann Steinbrecher
#Sourcery
#Nov. 2012

class IndexUpdater

  def initialize( text, decription, update, vendor )
        @text = text
        @description = description
	@update	= update
	@vendor = vendor
  end

  def performUpdate
	#solr.add type: ['Update', 'ActiveRecord::Base'], class_name: 'Update', id: 'Update #{update}', text_textp: @text, vendor_id_i: @vendor
  end

end
