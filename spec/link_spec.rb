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
  describe '#self.comments' do
    it 'returns an array of link comment objects that have text' do
      expect(Link.comments[0].text).to eq 'This is a comment about Makers Academy'
      expect(Link.comments[1].text).to eq 'This is a comment about Google'
      expect(Link.comments[2].text).to eq 'This is a comment about Facebook'
    end
    it 'returns an array of link comment objects with link ids' do
      expect(Link.comments[0].link_id).to eq "1"
      expect(Link.comments[1].link_id).to eq "2"
      expect(Link.comments[2].link_id).to eq "3"
    end
  end
  xdescribe '#self.add_comment' do

  end
end
