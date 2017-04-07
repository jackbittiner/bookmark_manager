describe User do

  let!(:user) do
    User.create(email: 'happyfriends@treehouse.com',
                password: 'password1234',
                password_confirmation: 'password1234')
              end

  describe '#authenticate' do
    it 'should authenticate the user if password matches' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end

    it 'does not authenticate user if password is incorrect' do
      non_authenticated_user = User.authenticate(user.email, "oasihfoaisf")
      expect(non_authenticated_user).to be_nil
    end
  end

  describe '#generate_token' do
    it 'saves a password recovery token when we generate a token' do
      expect { user.generate_token }.to change{ user.password_token }
    end
  end
end
