require "sinatra/base"
require "./lib/bookmark"

class Manager < Sinatra::Base
  enable :method_override
  get "/" do
    erb :index
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post "/bookmarks/new" do
    Bookmark.add(params[:url], params[:title])
    redirect "/bookmarks"
  end

  delete "/bookmarks/:id" do
    Bookmark.delete(params[:id])
    redirect "/bookmarks"
  end

  run! if app_file == $0
end
