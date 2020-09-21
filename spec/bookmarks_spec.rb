require "bookmarks"

describe Bookmarks do
  describe "#all" do
    it "returns all bookmarks stored by user" do
      session = Bookmarks.new(["https://www.bbc.com", "https://www.google.com", "https://www.cats.com", "https://www.reddit.com"])
      expect(session.all).to eq "https://www.bbc.com\nhttps://www.google.com\nhttps://www.cats.com\nhttps://www.reddit.com"
    end
  end
end
