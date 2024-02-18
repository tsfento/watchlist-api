class WatchList < ApplicationRecord
  validates :private, inclusion: [true, false]

  belongs_to :user
  has_many :watch_titles
end
