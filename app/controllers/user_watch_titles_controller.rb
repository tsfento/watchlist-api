class UserWatchTitlesController < ApplicationController
    before_action :authenticate_request

    def get_user_watch_titles
        if @current_user.username == params[:username]

            user_watch_titles = @current_user.user_watch_titles

            if user_watch_titles
                render json: UserWatchTitleBlueprint.render(user_watch_titles, view: :normal), status: :ok
            else
                render json user_watch_titles.errors, status: :ok
            end
        else
            render json: { error: 'Unauthorized' }, status: :unauthorized
        end
    end

    def update_user_watch_titles
        if @current_user.username == params[:username]
        
            user_watch_title = @current_user.user_watch_titles.last

            if user_watch_title
                render json: UserWatchTitleBlueprint.render(user_watch_title, view: :normal), status: :ok
            else
                render json user_watch_title.errors, status: :ok
            end
        else
            render json: { error: 'Unauthorized' }, status: :unauthorized
        end
    end

    def set_watched
        if @current_user.username == params[:username]
            # need to create watch_title if none exists yet
            watch_title = WatchTitle.create_with(watch_title_params).find_or_create_by(tmdb_id: params[:tmdb_id])
            user_watch_title = UserWatchTitle.find_or_create_by(user_id: @current_user.id, watch_title_id: watch_title.id)
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
            # need to create watch_title if none exists yet
            watch_title = WatchTitle.create_with(watch_title_params).find_or_create_by(tmdb_id: params[:tmdb_id])
            user_watch_title = UserWatchTitle.find_or_create_by(user_id: @current_user.id, watch_title_id: watch_title.id)
        end

        user_watch_title.rating = params[:rating]

        if user_watch_title.save
            render json: user_watch_title, status: :ok
        else
            render json: user_watch_title.errors, status: :ok
        end
    end

    private

    def watch_title_params
        params.permit(:tmdb_id, :imdb_id, :poster_path, :title, :release_date, :overview, :runtime)
    end
end
