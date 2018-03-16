require_relative './lib/database_connection'
require_relative './lib/link'
require_relative './lib/comment'


dbname = ENV['ENVIRONMENT'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
DatabaseConnection.setup(dbname)
Link.setup
Comment.setup
