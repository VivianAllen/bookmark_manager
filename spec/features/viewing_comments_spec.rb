feature 'Viewing comments' do
  xscenario 'A user can see comments' do
    visit '/'
    expect(page).to have_content 'This is a comment about Makers Academy'
    expect(page).to have_content 'This is a comment about Google'
    expect(page).to have_content 'This is a comment about Facebook'
  end
end
