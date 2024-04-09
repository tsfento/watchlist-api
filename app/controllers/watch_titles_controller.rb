class WatchTitlesController < ApplicationController
    before_action :set_user_and_list, only: [:add_title_to_list, :delete_title, :add_watch_date]
    before_action :authenticate_request, only: [:add_title_to_list, :delete_title, :add_watch_date]

    # def create
    #     watch_title = WatchTitle.new(watch_title_params)

    #     if watch_title.save
    #         render json: watch_title, status: :created
    #     else
    #         render json: watch_title.errors, status: :unprocessable_entity
    #     end
    # end

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

    def delete_title
        if (@watch_list.user_id == @current_user.id)

            if @watch_list.watch_titles.delete(WatchTitle.find_by(tmdb_id: params[:tmdb_id]))
                render json: nil, status: :no_content
            else
                render json: @watch_list.errors, status: :unprocessable_entity
            end
        end
    end

    def add_watch_date
        watch_date = WatchDateService.create_watch_date(params, @user.id)

        if watch_date.valid?
            render json: watch_date, status: :created
        else
            render json: watch_date.errors, status: :unprocessable_entity
        end
    end

    private

    def set_user_and_list
        @user = User.find_by(username: params[:username])
        @watch_list = WatchList.find(params[:id]) if params[:id].present?
    end

    def watch_title_params
        params.permit(:tmdb_id, :imdb_id, :poster_path, :title, :release_date, :overview, :runtime, :content_type)
    end
end
