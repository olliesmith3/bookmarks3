require "spec_helper.rb"

def clear_table(database = "bookmark_manager_test")
  connection = PG.connect(dbname: database)
  connection.exec("TRUNCATE TABLE bookmarks")
end

def add_bookmarks
  visit("/")
  click_button "Go to Bookmarks"
  fill_in :title, with: "The BBC Website"
  fill_in :url, with: "https://www.bbc.com"
  click_button "Add Bookmark"
  fill_in :title, with: "My Favourite Cats"
  fill_in :url, with: "https://www.cats.com"
  click_button "Add Bookmark"
end
