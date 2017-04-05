feature 'See a list of links on the homepage' do

  scenario 'Homepage should contain a list of all saved links' do

    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    visit('/links')

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end

  end

end
