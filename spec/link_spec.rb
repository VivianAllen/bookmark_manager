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
      Rake::Task[:reset_test_table].execute
      url = 'http://www.f1.com'
      title = ""
      Link.add_link(url, title)
      expect(Link.all[0].url).to eq url
    end
    it 'creates a link with a title and returns it' do
      Rake::Task[:reset_test_table].execute
      url = 'http://www.f1.com'
      title = 'F1'
      Link.add_link(url, title)
      expect(Link.all[0].title).to eq title
    end
  end
  describe '#self.delete_link' do
    it 'deletes a link' do
      Rake::Task[:reset_test_table].execute
      url = 'http://www.f1.com'
      title = 'F1'
      Link.add_link(url, title)
      Link.delete_link(4)
      expect(Link.all.count).to eq 0
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
end
