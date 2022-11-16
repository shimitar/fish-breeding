class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :contributor_confirmation, except: [:create]

  def index
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    @fish = Fish.find(params[:fish_id])
    redirect_to fish_path(id: @fish.id, fish_id: @fish.id)
  end

  private
  def question_params
    params.require(:question).permit(:question_text).merge(fish_id: params[:fish_id], user_id: current_user.id)
  end

  def contributor_confirmation
    @fish = Fish.find(params[:id])
    redirect_to root_path if current_user.id == @fish.user
  end
end
