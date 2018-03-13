require 'sinatra/base'
require_relative './lib/link'
require_relative './lib/database_connection'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    @links = Link.all
    erb :index
  end

  post '/add_link' do
    Link.add_link(params[:link_url])
    redirect '/'
  end

  run! if app_file == $0

end
