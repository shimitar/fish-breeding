class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @fish = Fish.find(params[:id])
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    # @fish = Fish.find(params[:fish_id])
    # @breed = Breed.find_by(fish_id: @fish.id)
    # @questions = Question.find_by(params[:fish_id])
    # @answers = @questions.answers.where(fish_id: params[:fish_id])
    redirect_to "/fishes/#{@question.fish.id}"
  end

  private
  def question_params
    params.require(:question).permit(:question_text).merge(fish_id: params[:fish_id], user_id: current_user.id)
  end
end
