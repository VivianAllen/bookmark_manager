require_relative 'database_connection'
require_relative 'link'


class Tag
  attr_reader :id, :text
  def initialize(id, text)
    @id = id
    @text = text
  end

  def self.setup(connect_class=DatabaseConnection)
    @connection = connect_class
  end

  def self.all_tags(link)
    rs = @connection.query "SELECT tags.id, content FROM link_tags INNER JOIN "\
    "tags ON tags.id = link_tags.tag_id WHERE link_tags.link_id = '#{link.id}';"
    rs.map { |tag| Tag.new(tag['id'], tag['text']) }
  end

  # def all_links
  #   rs = @connection.query "SELECT links.id, url, title FROM link_tags INNER "\
  #   "JOIN links ON links.id = link_tags.link_id WHERE link_tags.tag_id = "\
  #   "'#{self.id}';"
  #   rs.map { |link| Link.new(link['id'], link['text']) }
  # end

  # def self.add(link, text)
  #   tag_id = @connection.query \
  #   "INSERT INTO tags (text) VALUES ('#{text}') RETURNING id)"
  #   @connection.query \
  #   "INSERT INTO link_tags (link_id, tag_id) VALUES ('#{tag_id}', '#{link.id}')"
  # end
end
