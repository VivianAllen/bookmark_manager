feature 'Adding links to the existing list' do
  scenario 'A user can add links' do
    fakeurl = 'www.mocktest.com'
    fakettl = 'Mock Test'
    visit '/'
    fill_in :link_url, with: fakeurl
    fill_in :link_title, with: fakettl
    click_on 'Add link'
    expect(page).to have_content fakettl
  end
end
