require 'rails_helper'

RSpec.describe WatchListFollower, type: :model do
  context 'validation' do
    it 'is not valid without a user' do
      watch_list_follower = build(:watch_list_follower, user: nil)
      expect(watch_list_follower).not_to be_valid
    end

    it 'is not valid without a watch_list' do
      watch_list_follower = build(:watch_list_follower, watch_list: nil)
      expect(watch_list_follower).not_to be_valid
    end
  end

  context 'associations' do
    it 'belongs to a user' do
      watch_list_follower = create(:watch_list_follower)
      expect(watch_list_follower.user).to be_present
    end

    it 'belongs to a watch_list' do
      watch_list_follower = create(:watch_list_follower)
      expect(watch_list_follower.watch_list).to be_present
    end
  end
end
