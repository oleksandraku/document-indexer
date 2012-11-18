#Johann Steinbrecher
#Sourcery
#Nov. 2012

require 'yomu'

class DocProcesser

  def initialize( url, local=false )
        @url = url
        @local = local
  end

  def getText 
	if(@local)
	then
		data = File.read @url
  		metadata = Yomu.read :metadata, data	
		text = Yomu.read :text, data
	else
		yomu = Yomu.new @url
  		text = yomu.text
	end
  end
end
