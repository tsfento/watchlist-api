class WatchDate < ApplicationRecord
    validates :date, presence: true, uniqueness: true
  
    has_and_belongs_to_many :user_watch_titles
    has_many :users, through: :user_watch_title
    has_many :watch_titles, through: :user_watch_titles
  end
  