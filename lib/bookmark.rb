# require 'database_connection'
require "pg"
require 'uri'



class Bookmark
  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.all

    result = DatabaseConnection.query("SELECT * FROM bookmarks;")
    result.map { |bookmark|
      Bookmark.new(bookmark["id"], bookmark["title"], bookmark["url"])
    }
  end

  def self.add(bookmark_url, bookmark_title)
    return false unless is_url?(bookmark_url)
    result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES ('#{bookmark_url}', '#{bookmark_title}') RETURNING id, title, url;")

    Bookmark.new(result[0]["id"], result[0]["title"], result[0]["url"])
  end

  def self.delete(bookmark_id)

    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = '#{bookmark_id}';")
  end

  def self.find_by_id(bookmark_id)

    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = '#{bookmark_id}';")
    Bookmark.new(result[0]["id"], result[0]["title"], result[0]["url"])
  end

  def self.update(bookmark_id, bookmark_title, bookmark_url)
    result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{bookmark_url}', title = '#{bookmark_title}' WHERE id = '#{bookmark_id}' RETURNING id, title, url;")
    Bookmark.new(result[0]["id"], result[0]["title"], result[0]["url"])
  end

  private 

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
