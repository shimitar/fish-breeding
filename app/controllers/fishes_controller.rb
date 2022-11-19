class FishesController < ApplicationController
  before_action :set_fish, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @fishes = Fish.includes(:user)
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
    @breed = Breed.find_by(fish_id: @fish.id)
    @questions = @fish.questions.includes(:user)
    @answers = Answer.where(fish_id: @fish.id)
  end

  def edit
  end

  def update
    if @fish.update(fish_params)
      redirect_to fish_path
    else
      render :edit
    end
  end

  def destroy
    fish = Fish.find(params[:id])
    fish.destroy
    redirect_to root_path
  end

  private

  def set_fish
    @fish = Fish.find(params[:id])
  end

  def fish_breed_params
    params.require(:fish_breed).permit(:name, :size, :fish_text, :category_id, :image, :tank_size, :temperature,
                                       :filter, :raito, :condition, :sand, :plant, :breeding_text).merge(fish_id: params[:fish_id], user_id: current_user.id)
  end

  def fish_params
    params.require(:fish).permit(:name, :size, :fish_text, :category_id, :image).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @fish.user
  end
end
