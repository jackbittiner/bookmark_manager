feature 'Reset password' do

  before(:each) do
    signup
    Capybara.reset!
  end

  scenario 'User can click link to reset password' do
    visit '/sessions/new'
    click_link 'Forgot my password'
    expect(page).to have_content 'Please enter your email address'
  end

  scenario 'When email is entered user is told to check inbox' do
    recover_password
    expect(page).to have_content "Thanks, please check your inbox for a reset link"
  end

  scenario 'assigned a reset token to the user when they recover' do
    expect{ recover_password }.to change{ User.first.password_token }
  end
end
