class UserWatchTitlesController < ApplicationController
    before_action :authenticate_request

    def get_user_watch_titles
        titles = @current_user.user_watch_titles

        if titles
            render json: titles, methods: [:tmdb_id], status: :ok
        end
    end
end
