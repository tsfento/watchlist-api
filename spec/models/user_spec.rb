require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation' do
    it 'is not valid without a username' do
      user = build(:user, username: nil)
      expect(user).not_to be_valid
    end

    it 'is not valid with a username with less than 5 characters' do
      user = build(:user, username: 'bob')
      expect(user).not_to be_valid
    end

    it 'is not valid with a username with more than 15 characters' do
      user = build(:user, username: 'abcdefghijklmnop')
      expect(user).not_to be_valid
    end

    it 'is not valid with a username with invalid characters' do
      user = build(:user, username: 'jAk0b!')
      expect(user).not_to be_valid
    end

    it 'is not valid without an email' do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it 'is not valid with an email with less than 6 characters' do
      user = build(:user, email: 'a@b.c')
      expect(user).not_to be_valid
    end

    it 'is not valid with an email with more than 254 characters' do
      user = build(:user, email: 'Q5yciROpzU9aI7kpkqLsO5IECsnG2DjJ
        rj1OvA4miFKYGF3SI6lK7aqdLzRhgZAG
        QcLjyvLCvj4RV7mEpt4XmumTgLkrZ9jD
        3gqfL9X2zV9nVrTV9BR0hTVcGEzehL2x@
        0rNFCVh9QO40UHhoWASsqRJLo2dny322
        8IpSHklaASVl5X8Ot9803nTFUWhNv1HY
        wSBhjfkiWxcXyGeC6n8Gzwcuo5nQmQt8
        vvjzgj2Ae8WP3Aq4bkjCYMhjELohuiFw.com')
      expect(user).not_to be_valid
    end

    it 'is not valid without a password' do
      user = build(:user, password: nil)
      expect(user).not_to be_valid
    end

    it 'is not valid with a password less than 8 characters' do
      user = build(:user, password: 'a123!', password_confirmation: 'a1231')
      expect(user).not_to be_valid
    end

    it 'is not valid with a password without a number' do
      user = build(:user, password: 'password!', password_confirmation: 'password!')
      expect(user).not_to be_valid
    end

    it 'is not valid with a password without a special character' do
      user = build(:user, password: 'passw0rd', password_confirmation: 'passw0rd')
      expect(user).not_to be_valid
    end

    it 'is not valid with a password with invalid characters' do
      user = build(:user, password: 'password/', password_confirmation: 'password/')
      expect(user).not_to be_valid
    end

    it 'is not valid without password_confirmation' do
      user = build(:user, password_confirmation: nil)
      expect(user).not_to be_valid
    end

    it 'is valid with valid inputs' do
      user = build(:user,
        username: 'username',
        email: 'user@testing.com',
        password: 'passw0rd!',
        password_confirmation: 'passw0rd!'
      )
      expect(user).to be_valid
    end

    it 'hashes the password' do
      user = build(:user)
      expect(user.password_digest).not_to eq('password')
    end
  end

  context 'uniquness' do
    it 'is not valid without a unique username' do
      user1 = create(:user)
      user2 = build(:user, username: user1.username)
      expect(user2).not_to be_valid
      expect(user2.errors[:username]).to include('has already been taken')
    end

    it 'is not valid without a unique email' do
      user1 = create(:user)
      user2 = build(:user, email: user1.email)
      expect(user2).not_to be_valid
      expect(user2.errors[:email]).to include('has already been taken')
    end
  end

  context 'dependency destruction' do
    let(:user) { create(:user) }
    let(:user_id) { user.id }

    before { user.destroy }

    it 'deletes user' do
    end

    it 'deletes profile' do
    end

    it 'deletes watch_lists' do
    end

    it 'deletes user_watch_titles' do
    end

    it 'deletes watched_dates' do
    end
  end
end
