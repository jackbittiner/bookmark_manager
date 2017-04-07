def add_database_entry_with_tag
  visit('/links/new')
  fill_in 'url',   with: 'http://www.zombo.com/'
  fill_in 'title', with: 'This is Zombocom'
  fill_in 'tag', with: 'bubbles'
  click_button 'Add link'
end
