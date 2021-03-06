require_relative 'database_connection'

class Link

  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.setup(connect_class=DatabaseConnection)
    @connection = connect_class
  end

  def self.all
    rs = @connection.query "SELECT * FROM links"
    rs.map { |link| Link.new(link['id'], link['url'], link['title']) }
  end

  def self.add_link(url, title)
    return false unless self.valid_url(url)
    @connection.query \
    "INSERT INTO links (url, title) VALUES ('#{url}', '#{title}')"
  end

  def self.delete_link(id)
    @connection.query "DELETE FROM links WHERE id = '#{id}';"
  end

  def self.edit_link(id, url, title)
    @connection.query "UPDATE links SET url = '#{url}', "\
    "title = '#{title}' WHERE id = '#{id}';"
  end

  def self.return_link(link_id)
    link = @connection.query "SELECT * FROM links WHERE id = '#{link_id}'"
    Link.new(link[0]['id'], link[0]['url'], link[0]['title'])
  end

  private

  def self.valid_url(url)
    /(^(https?:\/\/)|^(w{3}\.))[a-z0-9\/\.]+/.match?(url)
  end
end
