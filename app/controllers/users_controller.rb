class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy, :lists_index, :followed_lists_index, :titles_show, :delete_list]
    before_action :authenticate_request, only: [:update, :destroy, :followed_lists_index, :delete_list]

    def show
        render json: @user, status: :ok
    end

    def create
        user = User.new(user_params)

        if user.save
            render json: user, status: :created
        else
            render json: user.errors, status: :unprocessable_entity
        end
    end

    def update
        if @user.update(user_params)
            render json: @user, status: :ok
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def destroy
        if @user.destroy
            render json: nil, status: :no_content
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    # user lists

    def lists_index
        if params[:page].to_i == -1
            watch_lists = @user.watch_lists
        else
            page = params.fetch(:page, 1).to_i
            per_page = 20
            offset = (page - 1) * per_page

            watch_lists = @user.watch_lists.offset(offset).limit(per_page)
        end

        render json: watch_lists,
        include: [:user => {only: :username}],
        methods: [:watch_titles_count, :poster_imgs],
        status: :ok
    end

    def followed_lists_index
        page = params.fetch(:page, 1).to_i
        per_page = 20
        offset = (page - 1) * per_page

        followed_lists = WatchList.joins(:watch_list_followers).where(:watch_list_followers => {:user_id => @user.id})

        followed_lists = followed_lists.offset(offset).limit(per_page)

        render json: followed_lists,
        include: [:user => {only: :username}],
        methods: [:watch_titles_count, :poster_imgs],
        status: :ok
    end

    def titles_show
        page = params.fetch(:page, 1).to_i
        per_page = 20
        offset = (page - 1) * per_page

        list = @user.watch_lists.find(params[:id])
        # titles = list.watch_titles.offset(offset).limit(per_page)
        titles = list.watch_titles[offset, per_page]

        render json: titles, status: :ok

        # if @current_user && list.user_id == @current_user.id
        #     # decide whether to keep current_user_watch_titles (currently getting separate)
        #     render json: titles, status: :ok
        # else
        #     render json: titles, status: :ok
        # end
    end

    def delete_list
        list = @user.watch_lists.find(params[:id])
        
        if @user.id == @current_user.id
            if list.destroy
                render json: nil, status: :no_content
            else
                render json: list.errors, status: :unprocessable_entity
            end
        else
            render json: { error: 'Unauthorized' }, status: :unauthorized
        end
    end

    private

    def set_user
        @user = User.find_by(username: params[:username])
    end

    def user_params
        params.permit(:email, :username, :password, :password_confirmation)
    end
end
