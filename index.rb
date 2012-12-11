# Johann Steinbrecher
# Sourcery
# Nov. 2012

require 'sinatra'
require_relative 'DocProcesser'  
require_relative 'IndexUpdater'

HTTP_SUCCESS = 200
HTTP_BAD_GATEWAY = 502

get '/vendor/:vendor_id/update/:update_id/document/*' do
  doc = DocProcesser.new params[:splat].first
  text = doc.get_text
  indexer = IndexUpdater.new
  a = indexer.perform_update text, params[:update_id], params[:vendor_id] 
  if a['responseHeader']['status'] == 0
	  status HTTP_SUCCESS
	else
	  error HTTP_BAD_GATEWAY		
  end	
end

