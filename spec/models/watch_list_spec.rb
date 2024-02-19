require 'rails_helper'

RSpec.describe WatchList, type: :model do
  context 'validation' do
    it 'is not valid without a user' do
      watch_list = build(:watch_list, user: nil)
      expect(watch_list).not_to be_valid
    end

    it 'is not valid without a private value' do
      watch_list = build(:watch_list, private: nil)
      expect(watch_list).not_to be_valid
    end
  end

  context 'uniqueness' do
    it 'is not valid with duplicate titles' do
      watch_list = create(:watch_list)
      watch_title = create(:watch_title)
      watch_list.watch_titles << watch_title
      # Try to add same title again
      watch_list.reload
      watch_list.watch_titles << watch_title
      debugger
      expect(watch_list.watch_titles.count).to be(1)
    end
  end

  context 'associations' do
    it 'belongs to a user' do
      watch_list = build(:watch_list)
      expect(watch_list.user).to be_present
    end

    it 'has many watch_titles' do
      watch_list = create(:watch_list)
      create_list(:watch_title, 3, watch_lists: [watch_list])

      watch_list.reload
      expect(watch_list.watch_titles.count).to eq(3)
    end
  end
end
