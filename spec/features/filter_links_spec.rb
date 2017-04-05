

feature 'Allows user to filter links by tags' do

  scenario 'Filter links by tags' do

    add_database_entry_with_tag

    visit '/tags/bubbles'
    within 'ul#links' do
    expect(page).to have_content 'zombo.com'
    end

  end

end
