require 'pg'

class Link
  def self.all
    rs = self.connect_db.exec "SELECT * FROM links"
    rs.map { |link| link['url'] }
  end

  def self.add_link(url)
    self.connect_db.exec "INSERT INTO links (url) VALUES ('#{url}')"
  end

  def self.connect_db
    PG.connect :dbname => self.select_db
  end

  def self.select_db
    ENV['ENVIRONMENT'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
  end
end
