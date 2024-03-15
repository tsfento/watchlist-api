class WatchTitlesController < ApplicationController
    before_action :set_user_and_list, only: [:add_title_to_list]
    before_action :authenticate_request, only: [:add_title_to_list]

    def create
        watch_title = WatchTitle.new(watch_title_params)

        if watch_title.save
            render json: watch_title, status: :created
        else
            render json: watch_title.errors, status: :unprocessable_entity
        end
    end

    def add_title_to_list
        watch_title = @watch_list.watch_titles.new(watch_title_params)

        if title_present = WatchTitle.find_by(tmdb_id: watch_title.tmdb_id)
            @current_user.user_watch_titles.create(user_id: @current_user.id, watch_title_id: title_present.id)
            @watch_list.watch_titles << title_present
            render json: title_present, status: :ok
        elsif watch_title.save
            @current_user.user_watch_titles.create(user_id: @current_user.id, watch_title_id: watch_title.id)
            @watch_list.watch_titles << watch_title
            render json: watch_title, status: :ok
        else
            render json: watch_title.errors, status: :unprocessable_entity
        end
    end

    private

    def set_user_and_list
        @user = User.find_by(username: params[:username])
        @watch_list = WatchList.find(params[:id])
    end

    def watch_title_params
        params.permit(:tmdb_id, :imdb_id, :poster_path, :title, :release_date, :overview, :runtime)
    end
end
