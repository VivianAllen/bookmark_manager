require_relative 'database_connection'
require_relative 'link'


class Comment
  attr_reader :id, :text, :link_id
  def initialize(id, text, link_id)
    @id = id
    @text = text
    @link_id = link_id
  end

  def self.setup(connect_class=DatabaseConnection)
    @connection = connect_class
  end

  def self.all(link)
    rs = @connection.query "SELECT * FROM comments WHERE link_id = '#{link.id}'"
    rs.map { |comment| Comment.new(comment['id'], comment['text'], comment['link_id']) }
  end

  def self.add(link, text)
    @connection.query \
    "INSERT INTO comments (text, link_id) VALUES ('#{text}', '#{link.id}')"
  end
end
