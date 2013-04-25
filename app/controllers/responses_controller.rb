class ResponsesController < ApplicationController
  def create
    @user = current_user
    if params[:question_id]
      @respondable = @question = Question.find(params[:question_id])
    else
      @respondable = Answer.find(params[:answer_id])
      @question = @respondable.question
    end

    @response = @respondable.responses.build(params[:response])
    @response.user = @user
    @response.save
    redirect_to question_path(@question)
  end

  def destroy
    if params[:question_id]
      @respondable = @question = Question.find(params[:question_id])
    else
      @respondable = Answer.find(params[:answer_id])
      @question = @respondable.question
    end
    @response = @respondable.responses.find(params[:id])
    @response.destroy
    redirect_to question_path(@question)
  end
end
