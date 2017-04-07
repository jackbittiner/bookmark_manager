feature 'signing in' do

  scenario 'successful sign in' do
    signup
    visit '/sessions/new'
    fill_in 'email', with: 'happyfriends@treehouse.com'
    fill_in 'password', with: 'password1234'
    click_button 'Log In'
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome, happyfriends@treehouse.com'
  end


  scenario 'unsuccessful sign in' do
    signup
    visit '/sessions/new'
    fill_in 'email', with: 'happyfriends@treehouse.com'
    fill_in 'password', with: 'password4321'
    click_button 'Log In'
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content 'The email or password is incorrect'
  end
end
