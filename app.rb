require 'sinatra/base'
require './lib/link'
require './lib/database_connection'
require './database_connection_setup'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @links = Link.all
    erb :index
  end

  post '/add_link' do
    flash[:notice] = 'ERROR: INVALID URL!' unless \
    Link.add_link(params[:link_url], params[:link_title])
    redirect '/'
  end

  post '/delete_link' do
    Link.delete_link(params[:id_to_delete].to_i)
    redirect '/'
  end

  post '/edit_link' do
    session[:id_to_edit] = params[:id_to_edit]
    erb :edit
  end

  post '/apply_edit' do
    Link.edit_link(session[:id_to_edit], params[:edit_url], params[:edit_title])
    redirect '/'
  end

  run! if app_file == $0

end
