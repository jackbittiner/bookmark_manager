require_relative '../../app/models/user'

feature 'signing up users' do
  scenario 'user signs up' do
    expect{ signup }.to change(User, :count).by(1)
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome, happyfriends@treehouse.com'
    expect(User.first.email).to eq('happyfriends@treehouse.com')

  end
end
