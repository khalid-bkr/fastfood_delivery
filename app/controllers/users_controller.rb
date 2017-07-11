class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :edit]

  def index         # GET /users
    if params[:role].present?
      @users = User.where(role: params[:role])
    else
      @users = User.all
    end
  end

  def show          # GET /users/:id
  end

  def new           # GET /users/new
    @user = User.new
  end

  def create        # POST /users
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit          # GET /users/:id/edit
  end

  def update        # PATCH /users/:id
    @user.update(user_params)
    redirect_to root_path
  end

  def destroy       # DELETE /users/:id
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :phone_number, :role)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
