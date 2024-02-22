class WatchListsController < ApplicationController
    def index
        watch_lists = WatchList.all.where(private: false)

        render json: watch_lists,
            include: [:user => {only: :username}],
            methods: [:watch_titles_count],
            status: :ok
    end

    def create
        user = User.find_by(username: params[:username])

        watch_list = user.watch_lists.new(watch_list_params)

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
