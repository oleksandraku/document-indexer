# Johann Steinbrecher
# Sourcery
# Nov. 2012

require 'sinatra'
require_relative 'DocProcesser'  
require_relative 'IndexUpdater'

#sinatra drops one slash on double slashes such as http://sample.url -> http:/sample.url
#Therefore, this little fix:
set :protection, :except => :path_traversal

get '/vendor/:vendor_id/update/:update_id/document/*' do
	doc = DocProcesser.new params[:splat].first
	text = doc.getText
  	"Proccessed text: #{text}"
end

