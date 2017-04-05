

feature 'Allows user to filter links by tags' do

  scenario 'Filter links by tags' do

    add_database_entry_with_tag
    fill_in 'filter_tag', with: 'bubbles'
    click_on 'Filter'
    expect(current_path).to eq '/tags/bubbles'
    expect(page).to have_content 'zombo.com'


  end

end
