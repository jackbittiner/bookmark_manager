class BookmarkManager < Sinatra::Base

  get '/tags/:filter_tag' do
    tag = Tag.first(name: params[:filter_tag])
    params[:filter_tag]
    @links = tag ? tag.links : []
    erb :'links/index'
  end

end
