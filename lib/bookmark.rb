require "pg"

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "bookmark_manager_test")
    else
      connection = PG.connect(dbname: "bookmark_manager")
    end

    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark|
      Bookmark.new(bookmark["id"], bookmark["title"], bookmark["url"])
    }
  end

  def self.add(bookmark_url, bookmark_title)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "bookmark_manager_test")
    else
      connection = PG.connect(dbname: "bookmark_manager")
    end

    result = connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{bookmark_url}', '#{bookmark_title}') RETURNING id, title, url;")

    Bookmark.new(result[0]["id"], result[0]["title"], result[0]["url"])
  end

  def self.delete(bookmark_id)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "bookmark_manager_test")
    else
      connection = PG.connect(dbname: "bookmark_manager")
    end

    connection.exec("DELETE FROM bookmarks WHERE id = '#{bookmark_id}';")
  end

  def self.find_by_id(bookmark_id)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "bookmark_manager_test")
    else
      connection = PG.connect(dbname: "bookmark_manager")
    end

    result = connection.exec("SELECT * FROM bookmarks WHERE id = '#{bookmark_id}';")
    Bookmark.new(result[0]["id"], result[0]["title"], result[0]["url"])
  end
end
