require "sinatra/base"
require "./lib/bookmark"
require "./lib/database_connection"
require 'sinatra/flash'

class Manager < Sinatra::Base
  enable :method_override, :sessions
  register Sinatra::Flash

  before do
    if ENV["ENVIRONMENT"] == "test"
      DatabaseConnection.setup("bookmark_manager_test")
    else
      DatabaseConnection.setup("bookmark_manager")
    end
  end
  
  get "/" do
    erb :index
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post "/bookmarks" do
    flash[:notice] = "You must submit a valid URL." unless Bookmark.add(params[:url], params[:title])
    redirect "/bookmarks"
  end

  delete "/bookmarks/:id" do
    Bookmark.delete(params[:id])
    redirect "/bookmarks"
  end

  get "/bookmarks/:id/edit" do
    @bookmark = Bookmark.find_by_id(params[:id])
    erb :edit
  end

  patch "/bookmarks/:id" do
    Bookmark.update(params[:id], params[:title], params[:url])
    redirect "/bookmarks"
  end

  run! if app_file == $0
end
