#Johann Steinbrecher
#Sourcery
#Nov. 2012

require 'yomu'

class DocProcesser
  class << self
    def get_text ( url, local=false )
      if local
        data = File.read url
        metadata = Yomu.read :metadata, data	
        text = Yomu.read :text, data
      else
        yomu = Yomu.new url
        text = yomu.text
      end   
    end
  end
end

