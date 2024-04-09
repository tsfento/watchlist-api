class WatchTitle < ApplicationRecord
    validates :tmdb_id, :poster_path, :title, :release_date, :overview, :runtime, :content_type, presence: true
    validates :tmdb_id, :poster_path, uniqueness: true

    has_many :user_watch_titles
    has_many :users, through: :user_watch_titles
    has_many :watch_dates, through: :user_watch_titles
    has_and_belongs_to_many :watch_lists
end
