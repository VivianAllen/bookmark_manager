require 'sinatra/base'
require './lib/link'
require './lib/database_connection'
require './database_connection_setup'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :"links/index"
  end

  post '/links/add' do
    flash[:notice] = 'ERROR: INVALID URL!' unless \
    Link.add_link(params[:link_url], params[:link_title])
    redirect '/links'
  end

  post '/links/delete' do
    Link.delete_link(params[:id_to_delete].to_i)
    redirect '/links'
  end

  post '/links/edit' do
    session[:id_to_edit] = params[:id_to_edit]
    session[:current_url] = params[:current_url]
    session[:current_title] = params[:current_title]
    erb :"links/edit"
  end

  post '/links/apply_edit' do
    Link.edit_link(session[:id_to_edit], params[:edit_url], params[:edit_title])
    redirect '/links'
  end

  run! if app_file == $0

end
