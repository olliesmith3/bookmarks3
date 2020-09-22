require "bookmarks"
require "./spec/features/web_helpers"

describe Bookmarks do
  describe "#add" do
    it "returns all bookmarks stored by user" do
      clear_table()
      Bookmarks.add("https://www.bbc.com")
      Bookmarks.add("https://www.cats.com")
      expect(Bookmarks.all).to include "https://www.bbc.com"
      expect(Bookmarks.all).to include "https://www.cats.com"
    end
  end
end
