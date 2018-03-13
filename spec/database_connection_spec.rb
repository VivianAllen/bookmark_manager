require 'database_connection'
require 'pg'

describe DatabaseConnection do
    it 'messages PG to open a connection' do
      expect(PG).to receive(:connect).with(any_args)
      DatabaseConnection.setup('bookmark_manager_test')
    end
    it 'messages PG to execute a query' do
      expect(PG).to receive(:exec).with(any_args)
      DatabaseConnection.query('SELECT * FROM links')
    end
end
