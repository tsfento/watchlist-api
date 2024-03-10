# frozen_string_literal: true

class WatchTitleBlueprint < Blueprinter::Base
    identifier :id
    fields :tmdb_id, :imdb_id, :poster_path, :title, :release_date, :overview, :runtime

    view :current_user_titles do
        association :user_watch_titles, blueprint: UserWatchTitleBlueprint
    end
end
