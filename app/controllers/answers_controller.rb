class AnswersController < ApplicationController

def index
  @fish = Fish.find_by(params[:fish_id])
  @question = Question.find(params[:question_id])
  @answer = Answer.new
end

def create
  binding.pry
    @answer = Answer.create(answer_params)
    @fish = Fish.find_by(params[:question_id])
    @breed = Breed.find_by(fish_id: @fish.id)
    # @answer = Answer.find(params[:question_id])
    redirect_to controller: :fishes, action: :index
end

  private
  def answer_params
    params.require(:answer).permit(:answer_text).merge(question_id: params[:question_id], fish_id: params[:fish_id], user_id: current_user.id)
  end
end
