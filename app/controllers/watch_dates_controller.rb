class WatchDatesController < ApplicationController
    before_action :authenticate_request

    def get_watch_dates
        user_watch_dates = WatchDateService.user_watch_dates(@current_user)

        render json: user_watch_dates
    end

    def add_watch_date
        watch_date = WatchDateService.create_watch_date(watch_date_params, watch_title_params, @current_user.id)

        if watch_date.valid?
            render json: watch_date, status: :created
        else
            render json: watch_date.errors, status: :unprocessable_entity
        end
    end

    private

    def watch_date_params
        params.permit(:date)
    end

    def watch_title_params
        params.permit(:tmdb_id, :imdb_id, :poster_path, :title, :release_date, :overview, :runtime)
    end
end
