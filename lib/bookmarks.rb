require "pg"

class Bookmarks
  DEFAULT_BOOKMARKS = ["https://www.bbc.com", "https://www.google.com", "https://www.cats.com", "https://www.reddit.com"]

  def initialize(array_of_bookmarks = DEFAULT_BOOKMARKS)
    @stored_bookmarks = array_of_bookmarks
  end

  def self.all(database = "bookmark_manager")
    connection = PG.connect(dbname: database)
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark["url"] }
  end

  def self.add(database = "bookmark_manager")
  end
end
