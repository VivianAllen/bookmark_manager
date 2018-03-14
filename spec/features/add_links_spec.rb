feature 'Adding links to the existing list' do
  scenario 'A user can add links' do
    fakeurl = 'www.mocktest.com'
    visit '/'
    fill_in :link_url, with: fakeurl
    click_on 'Add link'
    expect(page).to have_content fakeurl
  end
end
