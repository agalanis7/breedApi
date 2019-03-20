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
    if @user.save
        respond_to do |format|
          format.html do
            redirect_to users_path, notice: "User successfully created"
          end
          format.json do
            render json: @user
          end
        end
      else
        respond_to do |format|
          format.html do
            redirect_to users_path, alert: @user.errors.full_messages.join(', ')
          end
          format.json do
            render json: @task.errors.full_messages, status: 400
          end
        end
      end
    end
end

def destroy
    @user = User.find(params[:id])
    if @user.destroy
        head(:ok)
    else
        head(:unprocessable_entity)
    end
end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            render json: {status: 'SUCCESS', message: 'Updated user'}
        else
            render json: {status: 'ERROR', message: 'User not updated'}
        end
    end 
    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email)
    end

