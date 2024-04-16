class SessionsController < ApplicationController
    before_action :authenticate_request, only: [:check]

    def create
        user = User.find_by(username: params[:username])

        if user&.authenticate(params[:password])
            token = jwt_encode(user_id: user.id)
            render json: { token: token }, status: :ok
        else
            render json: { error: 'unauthorized' }, status: :unauthorized
        end
    end

    def check
        decoded = JWT.decode(params[:token], Rails.application.secret_key_base).first

        if decoded['exp'] < DateTime.now.to_i
            render json: { error: 'Token expired' }, status: :unauthorized
        elsif (DateTime.now.to_i < decoded['exp']) && DateTime.now.to_i > decoded['exp'] - 24.hours
            token = jwt_encode(user_id: @current_user.id)
            render json: { token: token }, status: :ok
        end
    end

    private

    def jwt_encode(payload, exp = 1.week.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, Rails.application.secret_key_base)
    end
end
