require 'sinatra'
require 'calais'
require_relative 'airbraker'
require_relative 'doc_processor'
require_relative 'index_updater'

HTTP_SUCCESS = 200
HTTP_BAD_GATEWAY = 502

get '/attachment/:attachment_id/document/*' do
  text = DocProcesser.get_text params[:splat].first
  a = IndexUpdater.perform_update text, params[:attachment_id]
  if a['responseHeader']['status'] == 0
   status HTTP_SUCCESS
  else
   error HTTP_BAD_GATEWAY
  end
end

