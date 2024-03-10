class UserWatchTitle < ApplicationRecord
  validates :watched, inclusion: [true, false]
  # validates :watch_title, uniqueness: true
  validates_uniqueness_of :watch_title_id, scope: :user_id

  belongs_to :user
  belongs_to :watch_title
end
