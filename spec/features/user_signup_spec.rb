require_relative '../../app/models/user'

feature 'signing up users' do
  scenario 'user signs up' do
    expect{ signup }.to change(User, :count).by(1)
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome, happyfriends@treehouse.com'
    expect(User.first.email).to eq('happyfriends@treehouse.com')

  end

  scenario 'mismatching password and password confirmation' do
    expect { signup(password_confirmation: 'BANANAS!!*&%@*£^%@!')}.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content ("Password does not match the confirmation")
  end

  scenario 'cant leave email box empty' do
    expect { signup(email: nil)}.not_to change(User, :count)
  end

  scenario 'cant give an invalid email address' do
    expect {signup(email: "poooooooooooooorly")}.not_to change(User, :count)
  end

  scenario 'should prevent duplciate sign up' do
    signup
    visit '/users/new'
    expect { signup }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

end
