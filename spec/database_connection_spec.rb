require 'database_connection'

describe DatabaseConnection do
  describe "#.setup" do
    it "connects to a specific database" do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end
  end
end