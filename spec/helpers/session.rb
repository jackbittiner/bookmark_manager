module SessionHelpers

  def signup(email: 'happyfriends@treehouse.com',
            password: 'password1234',
            password_confirmation: 'password1234')
    visit('/users/new')
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'submit'
  end

  def login(email: 'happyfriends@treehouse.com', password: 'password1234')
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Log In'
  end
end
