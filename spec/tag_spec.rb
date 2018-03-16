require 'tag'

describe Tag do

  let(:mock_connection_tags) { double :DatabaseConnection_tags,
    query: [{'id' => 1, 'text' => 'I am a tag'}] }
  let(:mock_link) { double :link, id: 1 }

  describe '#all_tags' do
    before :each do
      Tag.setup(mock_connection_tags)
    end
    it 'asks the database for all tags relating to a link' do
      expect(mock_connection_tags).to receive(:query).with \
      "SELECT tags.id, content FROM link_tags INNER JOIN "\
      "tags ON tags.id = link_tags.tag_id WHERE link_tags.link_id = '#{mock_link.id}';"
      Tag.all_tags(mock_link)
    end
    it 'returns the tags as tag objects' do
      expect(Tag.all_tags(mock_link)[0]).to be_an_instance_of(described_class)
    end
  end
end
