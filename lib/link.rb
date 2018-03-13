require 'pg'

class Link

  def self.all
    rs = DatabaseConnection.query "SELECT * FROM links"
    rs.map { |link| link['url'] }
  end

  def self.add_link(url)
    DatabaseConnection.query "INSERT INTO links (url) VALUES ('#{url}')"
  end
end
