require "pg"

class Bookmarks
  DEFAULT_BOOKMARKS = ["https://www.bbc.com", "https://www.google.com", "https://www.cats.com", "https://www.reddit.com"]

  def initialize(array_of_bookmarks = DEFAULT_BOOKMARKS)
    @stored_bookmarks = array_of_bookmarks
  end

  def all
    connection = PG.connect(dbname: "bookmark_manager")
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark["url"] }
  end
end
