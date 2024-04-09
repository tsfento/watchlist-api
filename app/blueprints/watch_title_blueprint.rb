# frozen_string_literal: true

class WatchTitleBlueprint < Blueprinter::Base
    identifier :id

    view :short do
        fields :tmdb_id, :title, :content_type
    end

    view :long do
        fields :tmdb_id, :imdb_id, :poster_path, :title, :release_date, :overview, :runtime, :content_type
    end
end
