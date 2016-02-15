class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index

    current_profile_id = execute_statement("Select id from profiles where email=" + "'" + current_user.email + "'")

    if current_profile_id != nil
      redirect_to profile_path(current_profile_id[0])
    end

  end

  def show
    respond_with(@profile)
  end

  def new
    @profile = Profile.new
    respond_with(@profile)
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.save
    respond_with(@profile)
  end

  def update
    @profile.update(profile_params)
    respond_with(@profile)
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])

    end

    def profile_params
      params.require(:profile).permit(:name, :age, :dob, :email)
    end
end
