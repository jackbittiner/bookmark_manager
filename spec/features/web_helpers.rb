def add_database_entry_with_tag
  visit('/links/new')
  fill_in 'url',   with: 'http://www.zombo.com/'
  fill_in 'title', with: 'This is Zombocom'
  fill_in 'tag', with: 'bubbles'
  click_button 'Add link'
end

def signup
  visit('/users/new')
  fill_in 'email', with: 'happyfriends@treehouse.com'
  fill_in 'password', with: 'password1234'
  click_button 'submit'
end
