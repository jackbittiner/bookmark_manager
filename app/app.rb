ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './app/models/link'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/links' do
    @links = Links.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    new_title = params[:title]
    new_url = params[:url]
    Links.create(url: new_url, title: new_title)
    redirect('/links')
  end
end
