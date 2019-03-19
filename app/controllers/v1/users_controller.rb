class V1::UsersController < ApplicationController
    def index
        @users = User.all
        
        render json: @users, status: :ok
    end

    def show
        @user = User.find(params[:id])
        
        render json: @user, status: :ok
    end

    def create
        @user = User.new(user_params)

        @user.save
        render json: @user, status: :created
    end

    def destroy
        @user = User.where(id: params[:id]).first_name
        if user.destroy
            head(:ok)
        else
            head(:unprocessable_entity)
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email)
    end
end
end
