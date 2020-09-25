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
      expect(result[0]["title"]).to eq 'BBC Homepage'
      expect(result[0]["url"]).to eq 'https://www.bbc.co.uk'
    end
  end
end