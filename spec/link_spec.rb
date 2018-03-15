require 'link'

describe Link do
  describe '#self.all' do
    it 'returns an array of links objects that have URLs' do
      links = Link.all
      expect(links[0].url).to eq "http://www.makersacademy.com"
      expect(links[1].url).to eq "http://www.google.com"
      expect(links[2].url).to eq "http://www.facebook.com"
    end
    it 'returns an array of links objects that have titles' do
      links = Link.all
      expect(links[0].title).to eq "Makers Academy"
      expect(links[1].title).to eq "Google"
      expect(links[2].title).to eq "Facebook"
    end
  end
  describe '#self.add_link' do
    it 'will not add an invalid link' do
      url = 'I AM NOT A LINK!'
      title = 'FAKO'
      expect(Link.add_link(url, title)).to eq false
    end
    it 'creates a link with a returns it' do
      url = 'http://www.f1.com'
      title = 'F1'
      Link.add_link(url, title)
      expect(Link.all[-1].url).to eq url
    end
    it 'creates a link with a title and returns it' do
      url = 'http://www.f1.com'
      title = 'F1'
      Link.add_link(url, title)
      expect(Link.all[-1].title).to eq title
    end
  end
  describe '#self.delete_link' do
    it 'deletes a link' do
      Link.delete_link(1)
      expect(Link.all[0].title).to eq "Google"
    end
  end
  describe '#self.edit_link' do
    it 'edits a link' do
      url = 'http://www.f1.com'
      title = 'F1'
      Link.edit_link(1, url, title)
      links = Link.all
      expect(links[-1].title).to eq "F1"
    end
  end
  describe '#comments' do
    it 'returns all comments for a link' do
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
