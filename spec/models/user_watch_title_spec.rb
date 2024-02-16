require 'rails_helper'

RSpec.describe UserWatchTitle, type: :model do
  context 'validation' do
    it 'is not valid without a user' do
      user_watch_title = build(:user_watch_title, user: nil)
      expect(user_watch_title).not_to be_valid
    end

    it 'is not valid without a watch_title' do
      user_watch_title = build(:user_watch_title, watch_title: nil)
      expect(user_watch_title).not_to be_valid
    end

    it 'is not valid without a watched condition' do
      user_watch_title = build(:user_watch_title, watched: nil)
      expect(user_watch_title).not_to be_valid
    end
  end

  context 'uniqueness' do
    it 'is not valid without a unique watch_title' do
      user_watch_title1 = create(:user_watch_title)
      user_watch_title2 = build(:user_watch_title, watch_title: user_watch_title1.watch_title)
      expect(user_watch_title2).not_to be_valid
      expect(user_watch_title2.errors[:watch_title]).to include('has already been taken')
    end
  end

  context 'associations' do
    it "belongs to a user" do
      user_watch_title = create(:user_watch_title)
      expect(user_watch_title.user).to be_present
    end

    it "belongs to a watch_title" do
      user_watch_title = create(:user_watch_title)
      expect(user_watch_title.watch_title).to be_present
    end
  end
end
