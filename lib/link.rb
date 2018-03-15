require 'pg'
require_relative 'database_connection'
require_relative 'comment'

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

  def self.delete_link(id)
    DatabaseConnection.query "DELETE FROM links WHERE id = '#{id}';"
  end

  def self.edit_link(id, url, title)
    DatabaseConnection.query "UPDATE links SET url = '#{url}', "\
    "title = '#{title}' WHERE id = '#{id}';"
  end

  def self.return_link(id)
    self.all.select { |link| id.to_s==link.id } [0] # can't find the link in this array!
  end

  def comments
    rs = DatabaseConnection.query "SELECT * FROM comments WHERE link_id='#{self.id}'"
    rs.map { |comment| Comment.new(comment['id'], comment['text'], comment['link_id']) }
  end

  def add_comment(text)
    DatabaseConnection.query "INSERT INTO comments (text, link_id) "\
    "VALUES ('#{text}', '#{self.id}')"
  end

  private

  def self.valid_url(url)
    /(^(https?:\/\/)|^(w{3}\.))[a-z0-9\/\.]+/.match?(url)
  end
end
