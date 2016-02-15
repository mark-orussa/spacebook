class GalaxiesController < ApplicationController
  before_action :set_galaxy, only: [:show, :edit, :update, :destroy]
  before_action :get_friends, only: :index
  before_action :authenticate_user!

  respond_to :html

  def index
    @galaxies = Galaxy.where(author: current_user.id).order("created_at desc")
    respond_with(@galaxies)
  end

  def show
    respond_with(@galaxy)
  end

  def new
    @galaxy = Galaxy.new
    respond_with(@galaxy)
  end

  def edit
  end

  def create
    @galaxy = Galaxy.new(galaxy_params)
    @galaxy.save
    redirect_to(galaxies_path)
  end

  def update
    @galaxy.update(galaxy_params)
    redirect_to(galaxies_path)
  end

  def destroy
    @galaxy.destroy
    respond_with(@galaxy)
  end

  def find_friends
    if params.has_key?(:find_friends) && params[:find_friends] != ''
      find_friends = Galaxy.find_friends(params[:find_friends], current_user.id)
      @found_friends = Array.new
      find_friends.find_each do |friend|
        @found_friends << friend
      end
      # respond_to :js
    else
      respond_to do |format|
        format.js { render file: 'galaxies/find_friends_empty' }
      end
      # render :nothing => true, :status => :ok
    end
  end


  def add_friend
    if params.has_key?(:friend_id) && params.has_key?(:friend_email)
      @add_friend = params
      Galaxy.add_friend(params[:friend_id], current_user.id)
    else
      render :nothing => true, :status => :ok
    end
  end

  def get_friends
    friends = Galaxy.get_friends(current_user.id)
    @friends = Array.new
    friends.find_each do |friend|
      @friends << friend
    end
  end

  private

  def set_galaxy
    @galaxy = Galaxy.find(params[:id])
  end

  def galaxy_params
    params.require(:galaxy).permit(:author, :content, :image, :tag)
  end

end
