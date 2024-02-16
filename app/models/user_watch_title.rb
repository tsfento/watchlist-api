class UserWatchTitle < ApplicationRecord
  validates :watched, inclusion: [true, false]
  validates :watch_title, uniqueness: true

  belongs_to :user
  belongs_to :watch_title
end
