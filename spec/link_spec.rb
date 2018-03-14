require 'link'

describe Link do
  describe '#self.all' do
    it 'returns an array of links objects that have URLs' do
      links = Link.all
      expect(links[0].url).to eq "http://www.makersacademy.com"
      expect(links[1].url).to eq "http://www.google.com"
      expect(links[2].url).to eq "http://www.facebook.com"
    end
  end
  describe '#self.add_link' do
    it 'will not add an invalid link' do
      url = 'I AM NOT A LINK!'
      expect(Link.add_link(url)).to eq false
    end
    it 'creates a link and returns it' do
      Rake::Task[:reset_test_table].execute
      url = 'http://www.f1.com'
      Link.add_link(url)
      expect(Link.all[0].url).to eq url
    end
  end
end
