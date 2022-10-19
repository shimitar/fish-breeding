class FishesController < ApplicationController
  def index
    @fishes = Fish.includes(:user)
  end

  def new
   @fishes = Fish.new
   end

private
  def fish_params
    params.require(:fish).permit(:name, :size, :fish_text, :category_id, :image).merge(user_id: current_user.id)
  end
end