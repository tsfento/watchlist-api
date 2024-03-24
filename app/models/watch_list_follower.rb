class WatchListFollower < ApplicationRecord
  belongs_to :user
  belongs_to :watch_list

  validates_uniqueness_of :watch_list, scope: :user_id
end
