# Johann Steinbrecher
# Sourcery
# Nov. 2012

require 'sinatra'
require 'yomu'
require_relative 'DocProcesser'  
require_relative 'IndexUpdate'

get '/vendor/:vendor_id/update/:update_id/document/:doc_url' do

	doc = DocProcesser.new params[:doc_url]
	text = doc.getText
  	"Proccessed text: #{text}"

end

