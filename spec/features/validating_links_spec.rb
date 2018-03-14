feature 'validating links' do
    scenario 'user adds an invalid link' do
      visit '/'
      notlink = 'I AM NOT A LINK'
      fill_in :link_url, with: notlink
      click_on 'Add link'
      expect(page).to have_content 'ERROR: INVALID URL!'
      expect(page).not_to have_content(notlink)
    end
end
