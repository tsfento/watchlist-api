class WatchTitle < ApplicationRecord
    validates :tmdb_id, :imdb_id, :poster_path, :title, :release_date, :overview, :runtime, presence: true
    validates :tmdb_id, :imdb_id, :poster_path, uniqueness: true

    has_and_belongs_to_many :watch_lists
end
