class WatchList < ApplicationRecord
  validates :private, inclusion: [true, false]

  belongs_to :user
  has_many :watch_list_followers
  has_many :users, through: :watch_list_followers
  has_and_belongs_to_many :watch_titles, -> { distinct }
end
