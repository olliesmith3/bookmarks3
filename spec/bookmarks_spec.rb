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

  describe "#delete" do
    it "checks that bookmarks can be deleted" do
      clear_table()
      bookmark = Bookmark.add("https://www.bbc.com", "The BBC Website")
      Bookmark.add("https://www.cats.com", "My Favourite Cats")
      Bookmark.delete(bookmark.id)
    end
  end
  describe "find_by_id" do
    it "returns a bookmark from the id" do
    end
  end

  describe "#update" do
    it "updates a bookmark with new values" do
    end
  end
end
