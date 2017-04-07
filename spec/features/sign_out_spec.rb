feature 'sign out' do

  scenario 'successful sign out' do
    signup
    visit '/sessions/new'
    fill_in 'email', with: 'happyfriends@treehouse.com'
    fill_in 'password', with: 'password1234'
    click_button 'Log In'

    click_button 'Sign Out'
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Goodbye!'
    expect(page).not_to have_content('Welcome, happyfriends@treehouse.com')
  end
end
