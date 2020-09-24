require 'pg'

class DatabaseConnection

  attr_reader :database

  def self.setup(database)
    @database = database
    PG.connect(dbname: @database)
  end
end