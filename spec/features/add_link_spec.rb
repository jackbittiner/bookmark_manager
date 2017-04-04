feature "Add site's address and title to the manager" do

  scenario 'Have ability to add new link' do
      visit('/links/new')
      expect(page).to have_content 'Add Link'
  end

  scenario 'Add specific info for a link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.zombo.com/'
    fill_in 'title', with: 'This is Zombocom'
    click_button 'Add link'

    # we expect to be redirected back to the links page
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('This is Zombocom')
    end
  end

end
