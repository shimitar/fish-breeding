class BreedsController < ApplicationController
  before_action :authenticate_user!
  before_action :contributor_confirmation, except: [:update]

  def edit
    @breed = Breed.find(params[:id])
  end

  def update
    @breed = Breed.find(params[:id])
    if @breed.update(breed_params)
      @fish = Fish.find(params[:fish_id])
      redirect_to fish_path(id: @fish.id)
    else
      render :edit
    end
  end

  private

  def breed_params
    params.require(:breed).permit(:tank_size, :temperature, :filter, :raito, :condition, :sand, :plant, :breeding_text).merge(fish_id: params[:fish_id], user_id: current_user.id)
  end

  def contributor_confirmation
    @fish = Fish.find(params[:fish_id])
    redirect_to root_path unless current_user == @fish.user
  end
end
