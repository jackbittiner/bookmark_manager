feature "Add site's address and title to the manager" do

  scenario 'Have ability to add new link' do
      visit('/links/new')
      expect(page).to have_content 'Add link'
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

  scenario 'user adds tag to link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.zombo.com/'
    fill_in 'title', with: 'This is Zombocom'
    fill_in 'tag', with: 'Sexy Lit'
    click_button 'Add link'
    expect(current_path).to eq '/links'
    within 'ul#links' do
      link = Links.first
      expect(link.tags.map(&:name)).to include('Sexy Lit')
    end
  end

end
