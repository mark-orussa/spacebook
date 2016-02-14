class GalaxiesController < ApplicationController
  before_action :set_galaxy, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html, :js

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
    if params[:find_friends] != ''
      find_friends = Galaxy.find_friends(params, current_user)
      @friends = Array.new
      @output = ""
      find_friends.each do |friend|
        @friends << friend.email
        @output += '<div>' + friend.email + '</div>'
      end
    elsif params[:add_friend] != ''

    else
      @friends = ''
    end
    respond_to do |format|
      # format.html { redirect_to @user, notice: 'User was successfully created.' }
      format.js
      # format.js { j render :partial => "find_friends.html.erb", :locals => { friends: @friends}}
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
