feature 'sign out' do

  scenario 'successful sign out' do
    signup
    login
    click_button 'Sign Out'
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Goodbye!'
    expect(page).not_to have_content('Welcome, happyfriends@treehouse.com')
  end
end
