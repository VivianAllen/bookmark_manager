feature 'deleting links' do
  scenario 'allows the user to delete a single link using the title' do
    visit '/'
    fill_in :title_to_delete, with: 'Facebook'
    click_on 'Delete link'
    expect(page).not_to have_content 'Facebook'
  end
end
