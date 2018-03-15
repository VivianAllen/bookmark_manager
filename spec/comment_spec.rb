require 'comment'

describe Comment do
  before :each do
    @text = 'I am a comment'
    @id = 1
    @link_id = 1
    @comment = described_class.new(@id, @text, @link_id)
  end
  describe 'basic functions' do
    it 'returns its text' do
      expect(@comment.text).to eq @text
    end
    it 'returns its id' do
      expect(@comment.id).to eq @id
    end
  end
end
