class WatchListsController < ApplicationController
    before_action :authenticate_request, only: [:create]

    def index
        watch_lists = WatchList.all.where(private: false)

        render json: watch_lists,
            include: [:user => {only: :username}],
            methods: [:watch_titles_count, :poster_img],
            status: :ok
    end

    def create
        watch_list = @current_user.watch_lists.new(watch_list_params)

        if watch_list.save
            render json: watch_list, status: :created
        else
            render json: watch_list.errors, status: :unprocessable_entity
        end
    end

    private

    def watch_list_params
        params.permit(:private, :title)
    end
end
