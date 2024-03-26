class UserWatchTitlesController < ApplicationController
    before_action :authenticate_request

    def get_user_watch_titles
        if @current_user.username == params[:username]

            user_watch_titles = @current_user.user_watch_titles

            render json: UserWatchTitleBlueprint.render(user_watch_titles, view: :normal), status: :ok
        else
            render json: { error: 'Unauthorized' }, status: :unauthorized
        end
    end

    def set_watched
        if @current_user.username == params[:username]
            watch_title = WatchTitle.find_by(tmdb_id: params[:id])
            user_watch_title = @current_user.user_watch_titles.find_by(watch_title_id: watch_title.id)
        end
        user_watch_title.watched = !user_watch_title.watched

        if user_watch_title.save
            render json: user_watch_title, status: :ok
        else
            render json: user_watch_title.errors, status: :ok
        end
    end

    def set_rating
        if @current_user.username == params[:username]
            watch_title = WatchTitle.find_by(tmdb_id: params[:id])
            user_watch_title = @current_user.user_watch_titles.find_by(watch_title_id: watch_title.id)
        end

        user_watch_title.rating = params[:rating]

        if user_watch_title.save
            render json: user_watch_title, status: :ok
        else
            render json: user_watch_title.errors, status: :ok
        end
    end
end
