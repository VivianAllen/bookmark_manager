require 'comment'

describe Comment do

  let(:mock_connection) { double :DatabaseConnection,
    query: [{'id' => 1, 'text' => 'I am a comment', 'link_id' => '1'}] }
  let(:mock_link) { double :link, id: 1 }

  before :each do
    Comment.setup(mock_connection)
  end

  describe '#comments' do
    it 'asks the database for all comments relating to a link' do
      expect(mock_connection).to receive(:query).with \
      "SELECT * FROM comments WHERE link_id = '#{mock_link.id}'"
      Comment.all(mock_link)
    end
    it 'returns the comments as comment objects' do
      expect(Comment.all(mock_link)[0]).to be_an_instance_of(described_class)
    end
  end
  describe '#add_comment' do
    it 'asks the database to add a comment relating to a link'do
      text = 'a comment about something'
      expect(mock_connection).to receive(:query).with \
      "INSERT INTO comments (text, link_id) VALUES ('#{text}', '#{mock_link.id}')"
      Comment.add(mock_link, text)
    end
  end
end
