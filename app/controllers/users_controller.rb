class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy, :lists_index, :list_show]

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

    def lists_index
        render json: @user.watch_lists, status: :ok
    end

    def list_show
        render json: @user.watch_lists.find(params[:id]).watch_titles, status: :ok
    end

    private

    def set_user
        @user = User.find_by(username: params[:username])
      end

    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end
end
