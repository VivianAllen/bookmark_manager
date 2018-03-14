feature 'deleting links' do
  scenario 'allows the user to delete a single link using the id' do
    visit '/'
    within '#link-1' do
      click_on 'Delete'
    end
    expect(page).not_to have_content 'Makers Academy'
    expect(page).to have_content 'Google'
  end
end
