# Johann Steinbrecher
# Sourcery
# Nov. 2012

require 'sinatra'

get '/vendor/:vendor_id/update/:update_id/document/:doc_url' do
  "Vendor ID #{params[:vendor_id]} Update ID #{params[:update_id]} Document URL #{params[:doc_url]}"
end

