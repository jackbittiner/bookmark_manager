feature "Add site's address and title to the manager" do

  scenario 'Have ability to add new link' do
      visit('/links/new')
      expect(page).to have_content 'Add Link'
    end

end
