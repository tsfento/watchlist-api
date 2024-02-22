class WatchList < ApplicationRecord
  validates :private, inclusion: [true, false]
  validates :title, presence: true, uniqueness: { scope: :user_id }

  belongs_to :user
  has_many :watch_list_followers
  has_many :users, through: :watch_list_followers
  has_and_belongs_to_many :watch_titles, -> { distinct }

  def watch_titles_count
    watch_titles.count
end
end
