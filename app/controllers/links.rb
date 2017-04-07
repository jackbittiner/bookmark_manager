class BookmarkManager < Sinatra::Base

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

end
