feature 'adding comments' do
  scenario 'a user can add comments to link and see the results' do
    visit '/'
    within '#link-1' do
      click_on 'Add comment'
    end
    comment_text = 'This is another comment about makers academy'
    fill_in :text, with: comment_text
    click_on 'Submit'
    within '#link-1' do
      expect(page).to have_content comment_text
    end
  end
end
