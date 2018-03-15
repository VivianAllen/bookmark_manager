class Comment
  attr_reader :id, :text, :link_id
  def initialize(id, text, link_id)
    @id = id
    @text = text
    @link_id = link_id
  end
end
