class UsersController < ApplicationController
    before_action :set_user, only: %i[show edit update destroy]
    def index
        users = Users::List.new(params).execute

        render json: users, meta: pagination(users), each_serializer: UserSerializer, status: :ok
    end
  
    def show
        render json: @user, serializer: UserSerializer, status: :ok
    end
  
    def create
        @user = Users::Create.new(user_params).execute

        render json: @user, serializer: UserSerializer, status: :created
    end
  
    def update
        @user.update!(user_params)

        render json: @user, serializer: UserSerializer, status: :ok
    end
  
    def destroy
        @user.destroy!

        head :no_content
    end

    private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :admin)
  end

end