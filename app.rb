require "sinatra/base"
require "./lib/bookmarks"

class Manager < Sinatra::Base
  get "/" do
    erb :index
  end

  get "/bookmarks" do
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  post "/add_bookmark" do
    Bookmarks.add(params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
