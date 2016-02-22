class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index


    redirect_to profile_path(current_user.id)


  end

  def show
    respond_with(@user)
  end

  def new
    @user = User.new
    respond_with(@user)
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.save
    respond_with(@user)
  end

  def update
    @user.update(user_params)
    redirect_to profile_path(current_user.id)
  end

  def destroy
    @user.destroy
    respond_with(@user)
  end

  private
    def set_user
      @user = User.find(params[:id])

    end

    def user_params
      params.require(:user).permit(:fName, :lName, :age, :dob, :avatar, :comments)
    end
end
