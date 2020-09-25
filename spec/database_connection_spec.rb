require 'database_connection'
require "./spec/features/web_helpers"

describe DatabaseConnection do
  describe "#.setup" do
    it "connects to a specific database" do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  describe "#.query" do
    it "executes the SQL query provided on the connection instance variable" do
      DatabaseConnection.setup('bookmark_manager_test')
      DatabaseConnection.query('TRUNCATE TABLE bookmarks;')
      result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES ('https://www.bbc.co.uk', 'BBC Homepage') RETURNING url, title;")
      p result[0]["title"]
      #expect(DatabaseConnection.query("SELECT * FROM bookmarks;")).to eq hash
    end
  end
end