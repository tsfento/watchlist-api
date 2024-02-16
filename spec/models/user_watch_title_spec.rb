require 'rails_helper'

RSpec.describe UserWatchTitle, type: :model do
  context 'validation' do
    it 'is not valid without a user' do
      watch_title = create(:watch_title)
      user_watch_title = build(:user_watch_title, user: nil, watch_title: watch_title)
      expect(user_watch_title).not_to be_valid
    end

    it 'is not valid without a watch_title' do
      user = create(:user)
      user_watch_title = build(:user_watch_title, user: user, watch_title: nil)
      expect(user_watch_title).not_to be_valid
    end

    it 'is not valid without a watched condition' do
      user = create(:user)
      watch_title = create(:watch_title)
      user_watch_title = build(:user_watch_title, user: user, watch_title: watch_title, watched: nil)
      expect(user_watch_title).not_to be_valid
    end
  end

  context 'uniqueness' do
    it 'is not valid without a unique watch_title' do
      user = create(:user)
      watch_title = create(:watch_title)
      user_watch_title1 = create(:user_watch_title, user: user, watch_title: watch_title)
      user_watch_title2 = build(:user_watch_title, user: user, watch_title: watch_title)
      expect(watch_title2).not_to be_valid
      expect(watch_title2.errors[:watch_title]).to include('has already been taken')
    end
  end
end
