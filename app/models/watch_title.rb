class WatchTitle < ApplicationRecord
    validates :tmdb_id, :imdb_id, :poster_path, :title, :release_date, :overview, :runtime, presence: true
    validates :tmdb_id, :imdb_id, :poster_path, uniqueness: true

    has_many :user_watch_titles
    has_many :users, through: :user_watch_titles
end