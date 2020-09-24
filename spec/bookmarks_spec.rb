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
      clear_table()
      bookmark = Bookmark.add("https://www.bbc.com", "The BBC Website")
      return_value = Bookmark.find_by_id(bookmark.id)
      expect(return_value.title).to eq "The BBC Website"
      expect(return_value.url).to eq "https://www.bbc.com"
    end
  end

  describe "#update" do
    it "updates a bookmark with new values" do
      clear_table()
      bookmark = Bookmark.add("https://www.bbc.com", "The BBC Website")
      bookmark = Bookmark.update(bookmark.id, "BBC News", "https://www.bbc.com/news")
      expect(bookmark.title).to eq "BBC News"
      expect(bookmark.url).to eq "https://www.bbc.com/news"
    end
  end
end
