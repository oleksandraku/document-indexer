# Johann Steinbrecher
# Sourcery
# Nov. 2012

require 'sinatra'
require_relative 'DocProcesser'  
require_relative 'IndexUpdater'

SOLR_URL = 'http://localhost:8983/solr'

get '/vendor/:vendor_id/update/:update_id/document/*' do
	doc = DocProcesser.new params[:splat].first
	text = doc.get_text
	indexer = IndexUpdater.new SOLR_URL
	a = indexer.perform_update text, params[:update_id], params[:vendor_id] 
	"#{a}"
end

