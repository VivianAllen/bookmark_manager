require 'comment'

describe Comment do

  let(:mock_connection) { double :DatabaseConnection,
    query: nil }
  let(:mock_link) { double :link, id: 1 }

  before :each do
    Comment.setup(mock_connection)
  end

  describe '#comments' do
    it 'asks the database for all comment relating to a link' do
      expect(Link.all[0].comments[0].text).to eq 'This is a comment about Makers Academy'
    end
  end
  describe '#add_comment' do
    it 'adds a comment'do
      text = 'a comment about something'
      Link.all[0].add_comment(text)
      expect(Link.all[0].comments[-1].text).to eq text
    end
  end
end
