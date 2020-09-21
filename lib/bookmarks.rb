class Bookmarks
  DEFAULT_BOOKMARKS = ["https://www.bbc.com", "https://www.google.com", "https://www.cats.com", "https://www.reddit.com"]

  def initialize(array_of_bookmarks = DEFAULT_BOOKMARKS)
    @stored_bookmarks = array_of_bookmarks
  end

  def all
    return @stored_bookmarks.join("\n")
  end
end
