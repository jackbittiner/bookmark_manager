def add_database_entry_with_tag
  visit('/links/new')
  fill_in 'url',   with: 'http://www.zombo.com/'
  fill_in 'title', with: 'This is Zombocom'
  fill_in 'tag', with: 'bubbles'
  click_button 'Add link'
end

def signup(email: 'happyfriends@treehouse.com',
          password: 'password1234',
          password_confirmation: 'password1234')
  visit('/users/new')
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'submit'
end
