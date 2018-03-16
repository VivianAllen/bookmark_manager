feature 'Viewing tags' do
  scenario 'A user can see tags' do
    visit '/'
    expect(page).to have_content 'Tag for Makers Academy'
    expect(page).to have_content 'Tag for Makers Academy'
    expect(page).to have_content 'Tag for Makers Academy'
  end
end
