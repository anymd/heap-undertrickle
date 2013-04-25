class ResponsesController < ApplicationController
  def create
    @user = current_user
    @question = Question.find(params[:question_id])
    @response = @question.responses.build(params[:response])
    @response.user = @user
    @response.save
    redirect_to question_path(@question)
  end

  def destroy
    @question = Question.find(params[:question_id])
    @response = @question.responses.find(params[:id])
    @response.destroy
    redirect_to question_path(@question)
  end
end
