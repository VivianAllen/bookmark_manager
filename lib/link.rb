require 'pg'

class Link

  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    rs = DatabaseConnection.query "SELECT * FROM links"
    rs.map { |link| Link.new(link['id'], link['url'], link['title']) }
  end

  def self.add_link(url, title)
    return false unless self.valid_url(url)
    DatabaseConnection.query \
    "INSERT INTO links (url, title) VALUES ('#{url}', '#{title}')"
  end

  def self.delete_link(title)
    DatabaseConnection.query "DELETE FROM links WHERE title = '#{title}';"
  end

  private

  def self.valid_url(url)
    /^(https*:\/\/)*w{3}\.[a-z0-9\-\.]+/.match?(url)
  end

end
