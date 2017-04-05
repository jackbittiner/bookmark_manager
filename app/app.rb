ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './app/models/link'
require_relative './models/data_mapper_setup'

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
    new_tag = params[:tag]
    tag = Tag.first_or_create(name: new_tag)
    link = Links.create(url: new_url, title: new_title)
    link.tags << tag
    link.save
    redirect('/links')
  end
end
