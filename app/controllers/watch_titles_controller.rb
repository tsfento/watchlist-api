class WatchTitlesController < ApplicationController
    def create
        watch_title = WatchTitle.new(watch_title_params)

        if watch_title.save
            render json: watch_title, status: :created
        else
            render json: watch_title.errors, status: :unprocessable_entity
        end
    end

    private

    def watch_title_params
        params.permit(:tmdb_id, :imdb_id, :poster_path, :title, :release_date, :overview, :runtime)
    end
end
