require "sinatra/base"
require "./lib/bookmark"

class Manager < Sinatra::Base
  get "/" do
    erb :index
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post "/add_bookmark" do
    Bookmark.add(params[:url], params[:title])
    redirect "/bookmarks"
  end

  run! if app_file == $0
end
