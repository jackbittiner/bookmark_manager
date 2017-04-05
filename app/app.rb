ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect('/links')
  end
  get '/links' do
    @links = Link.all
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
    link = Link.create(url: new_url, title: new_title)
    link.tags << tag
    link.save
    redirect('/links')
  end

  get '/tags/:filter_tag' do
    tag = Tag.first(name: params[:filter_tag])
    params[:filter_tag]
    @links = tag ? tag.links : []
    erb :'links/index'

  end

end
