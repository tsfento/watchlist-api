class WatchListsController < ApplicationController
    def index
        watch_lists = WatchList.all.where(private: false)

        render json: watch_lists, status: :ok
    end
end
