require "bookmarks"

describe Bookmarks do
  describe "#all" do
    it "returns all bookmarks stored by user" do
      session = Bookmarks.new
      expect(session.all).to include "https://www.bbc.com"
      expect(session.all).to include "https://www.cats.com"
    end
  end
end
