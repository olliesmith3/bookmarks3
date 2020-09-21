require "sinatra/base"

class Manager < Sinatra::Base
  get "/" do
    "Hello World"
  end

  get "/bookmarks" do
    $bookmarks = Bookmarks.new
    erb :bookmarks
  end

  run! if app_file == $0
end
