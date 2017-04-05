feature 'adding tags' do
  scenario 'user adds tag to link' do
    add_database_entry_with_tag
    expect(current_path).to eq '/links'
    within 'ul#links' do
      link = Link.first
      expect(link.tags.map(&:name)).to include('bubbles')
    end
  end

  scenario 'user adds second tag to link' do
    visit('/links/new')
    fill_in 'url',   with: 'http://www.zombo.com/'
    fill_in 'title', with: 'This is Zombocom'
    fill_in 'tag', with: 'bubbles buble'
    click_button 'Add link'
    within 'ul#links' do
      link = Link.first
      expect(link.tags.map(&:name)).to include('bubbles', 'buble')
    end
  end
end
