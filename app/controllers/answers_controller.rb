class AnswersController < ApplicationController

def index
  @fish = Fish.find_by(id:params[:fish_id])
  @question = Question.find(params[:question_id])
  @answer = Answer.new
end

def create
  @answer = Answer.create(answer_params)
  if @answer.save 
  fish = Fish.find(params[:fish_id])
    redirect_to fish_path(id: fish.id, fish_id: fish.id)
  else
    @fish = Fish.find_by(id:params[:fish_id])
    render :index
  end  
end

  private
  def answer_params
    params.require(:answer).permit(:answer_text).merge(question_id: params[:question_id], fish_id: params[:fish_id], user_id: current_user.id)
  end
end