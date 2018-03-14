require 'pg'

class Link

  attr_reader :id, :url

  def initialize(id, url)
    @id = id
    @url = url
  end

  def self.all
    rs = DatabaseConnection.query "SELECT * FROM links"
    rs.map { |link| Link.new(link['id'], link['url']) }
  end

  def self.add_link(url)
    return false unless self.valid_url(url)
    DatabaseConnection.query "INSERT INTO links (url) VALUES ('#{url}')"
  end

  private

  def self.valid_url(url)
    /^(https*:\/\/)*w{3}\.[a-z0-9\-\.]+/.match?(url)
  end

end
