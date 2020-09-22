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

  run! if app_file == $0
end
