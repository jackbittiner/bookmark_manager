ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

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
    tags_array = new_tag.split
    tags_array.map! {|tag| Tag.first_or_create(name: tag)}
    link = Link.create(url: new_url, title: new_title)
    tags_array.each {|tag| link.tags << tag }
    link.save
    redirect('/links')
  end

  get '/tags/:filter_tag' do
    tag = Tag.first(name: params[:filter_tag])
    params[:filter_tag]
    @links = tag ? tag.links : []
    erb :'links/index'

  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
      @user = User.new(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
      if @user.save
         session[:user_id] = @user.id
         redirect to('/links')
      else
          # require 'pry'; binding.pry;
          flash.now[:errors] = @user.errors.full_messages
          erb :'users/new'
      end
  end


  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect('/links')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect('/links')
  end


  run! if app_file == $0
end
