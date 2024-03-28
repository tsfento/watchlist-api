class WatchListsController < ApplicationController
    before_action :authenticate_request, only: [:create, :follow_list, :unfollow_list]

    def index
        page = params.fetch(:page, 1).to_i
        per_page = 20
        offset = (page - 1) * per_page

        # watch_lists = WatchList.all.where(private: false)
        # below excludes lists with no titles
        watch_lists = WatchList.all.where(private: false).where.associated(:watch_titles).distinct

        watch_lists = watch_lists.offset(offset).limit(per_page)

        render json: watch_lists,
            include: [:user => {only: :username}],
            methods: [:watch_titles_count, :poster_imgs],
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

    def follow_list
        # watch_list = WatchList.find(params[:id])
        follow = WatchListFollower.new(user_id: @current_user.id, watch_list_id: params[:id])

        if follow.save
            render json: follow, status: :ok
        else
            render json: follow.errors, status: :unprocessable_entity
        end
    end

    def unfollow_list
        follow = WatchListFollower.find_by(user_id: @current_user.id, watch_list_id: params[:id])

        if follow.destroy
            render json: nil, status: :ok
        else
            render json: follow.errors, status: :unprocessable_entity
        end
    end

    private

    def watch_list_params
        params.permit(:private, :title)
    end
end
