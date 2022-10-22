class FishesController < ApplicationController

  def index
    @fishes = Fish.includes(:user)
    @breeds = Breed.includes(:user)
  end

  def new
    @fish_breed = FishBreed.new
  end

  def create
    @fish_breed = FishBreed.new(fish_breed_params)
    if @fish_breed.valid?
      @fish_breed.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @fish = Fish.find(params[:id])
    @breed = Breed.find_by(fish_id: params[:id])
  end

  private

  def fish_breed_params
    params.require(:fish_breed).permit(:name, :size, :fish_text, :category_id, :image, :tank_size, :temperature,
                                          :filter, :raito, :condition, :sand, :plant, :breeding_text).merge(fish_id: params[:fish_id], user_id: current_user.id)
  end

end
