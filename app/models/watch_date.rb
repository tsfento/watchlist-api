class WatchDate < ApplicationRecord
    validates :date, presence: true, uniqueness: true
    # validates_uniqueness_of :date, scope: :user_watch_title_id
  
    # FYI, below will not throw an error, it just does not create a new record
    has_and_belongs_to_many :user_watch_titles, -> { distinct }
    has_many :users, through: :user_watch_title
    has_many :watch_titles, through: :user_watch_titles
  end
  