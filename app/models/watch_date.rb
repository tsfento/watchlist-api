class WatchDate < ApplicationRecord
    validates :date, presence: true, uniqueness: true
  
    has_and_belongs_to_many :user_watch_titles
  end
  