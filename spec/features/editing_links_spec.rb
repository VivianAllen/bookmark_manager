feature 'editing a link' do
  scenario 'editing a link' do
    visit '/'
    within '#link-1' do
      click_on 'Edit'
    end
    url = 'http://www.f1.com'
    title = 'F1'
    fill_in :edit_url, with: url
    fill_in :edit_title, with: title
    click_on 'Submit'
    expect(page).to have_content title
    expect(page).not_to have_content 'Makers Academy'
  end
end
