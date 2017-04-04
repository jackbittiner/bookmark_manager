require 'sinatra/base'
require './app/models/link'


class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Links.all
    erb :'links/index'
  end

end
