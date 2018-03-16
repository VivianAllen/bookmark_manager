require 'link'

describe Link do

  let(:mock_connection) { double :DatabaseConnection,
    query: [{'id' => 1, 'url' => 'http://www.makersacademy.com', 'title' => 'Makers Academy'}] }

  before :each do
    Link.setup(mock_connection)
  end

  describe '#self.all' do
    it 'requests all links from the the database for all links' do
      expect(mock_connection).to receive(:query).with "SELECT * FROM links"
      Link.all
    end
  end
  describe '#self.add_link' do
    it 'sends a new link to the database' do
      url = 'http://www.f1.com'
      title = 'F1'
      expect(mock_connection).to receive(:query).with \
      "INSERT INTO links (url, title) VALUES ('#{url}', '#{title}')"
      Link.add_link(url, title)
    end
    it 'will not try and add an invalid link' do
      url = 'I AM NOT A LINK!'
      title = 'FAKO'
      expect(Link.add_link(url, title)).to eq false
    end
  end
  describe '#self.delete_link' do
    it 'asks the database to delete a link' do
      id = 1
      expect(mock_connection).to receive(:query).with \
       "DELETE FROM links WHERE id = '#{id}';"
      Link.delete_link(1)
    end
  end
  describe '#self.edit_link' do
    it 'asks the database to edit a link' do
      id = 1
      url = 'http://www.f1.com'
      title = 'F1'
      expect(mock_connection).to receive(:query).with \
      "UPDATE links SET url = '#{url}', "\
      "title = '#{title}' WHERE id = '#{id}';"
      Link.edit_link(1, url, title)
    end
  end
  describe '#self.return_link' do
    it 'creates a new link instance from database data' do
      id = 1
      expect(Link.return_link(id).title).to eq 'Makers Academy'
    end
  end
end
