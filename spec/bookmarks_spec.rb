require "bookmarks"
require "./spec/features/web_helpers"

describe Bookmarks do
  describe "#all" do
    it "returns all bookmarks stored by user" do
      clear_table()
      expect(Bookmarks.all("bookmark_manager_test")).to include "https://www.bbc.com"
      expect(Bookmarks.all("bookmark_manager_test")).to include "https://www.cats.com"
    end
  end
end
