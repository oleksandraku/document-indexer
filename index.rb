# Johann Steinbrecher
# Sourcery
# Nov. 2012

require 'sinatra'
require_relative 'DocProcesser'  
require_relative 'IndexUpdater'


get '/vendor/:vendor_id/update/:update_id/document/*' do
	doc = DocProcesser.new params[:splat].first
	text = doc.get_text
  	"Proccessed text: #{text}"
end

