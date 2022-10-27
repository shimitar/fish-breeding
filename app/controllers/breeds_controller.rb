class BreedsController < ApplicationController

  def edit
    @fish = Fish.find(params[:fish_id])
    @breed = Breed.find(params[:id])
  end

  def update
    @breed = Breed.find(params[:id])
    if @breed.update(breed_params)
      @fish = Fish.find(params[:fish_id])
      @questions = Question.where(fish_id: params[:id] )
      render template: "fishes/show"
    else
      render :edit
    end
  end

  private

  def breed_params
    params.require(:breed).permit(:tank_size, :temperature, :filter, :raito, :condition, :sand, :plant, :breeding_text).merge(fish_id: params[:fish_id], user_id: current_user.id)
  end

end
