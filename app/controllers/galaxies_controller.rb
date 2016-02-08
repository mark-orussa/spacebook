class GalaxiesController < ApplicationController
  before_action :set_galaxy, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @galaxies = Galaxy.where(author: current_user.email).order("created_at desc")
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

  private
    def set_galaxy
      @galaxy = Galaxy.find(params[:id])
    end

    def galaxy_params
      params.require(:galaxy).permit(:author, :content, :image, :tag)
    end
end
