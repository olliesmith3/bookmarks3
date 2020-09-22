require "Bookmark"
require "./spec/features/web_helpers"

describe Bookmark do
  describe "#add" do
    it "returns all Bookmark stored by user" do
      clear_table()
      Bookmark.add("https://www.bbc.com", "The BBC Website")
      Bookmark.add("https://www.cats.com", "My Favourite Cats")
      expect(Bookmark.all[0].url).to eq "https://www.bbc.com"
      expect(Bookmark.all[1].url).to eq "https://www.cats.com"
    end
  end
end
