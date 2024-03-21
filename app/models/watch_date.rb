class WatchDate < ApplicationRecord
    validates :date, presence: true, uniqueness: true
  
    # FYI, below will not throw an error, it just does not create a new record
    has_and_belongs_to_many :user_watch_titles
  end
  