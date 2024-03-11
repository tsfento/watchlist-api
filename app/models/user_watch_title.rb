class UserWatchTitle < ApplicationRecord
  validates :watched, inclusion: [true, false]
  # below prevented more than one user from making a user_watch_title for same title
  # validates :watch_title, uniqueness: true
  # fixed:
  validates_uniqueness_of :watch_title_id, scope: :user_id

  belongs_to :user
  belongs_to :watch_title
end
