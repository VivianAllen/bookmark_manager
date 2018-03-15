feature 'Viewing links' do
  scenario 'A user can see links' do
    visit '/'
    expect(page).to have_content "Makers Academy"
    expect(page).to have_content "Google"
    expect(page).to have_content "Facebook"
  end
end
