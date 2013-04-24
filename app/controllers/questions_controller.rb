class QuestionsController < ApplicationController

  def new
    @question = Question.new(params[:user])
    render :new
  end

  def index
    if @current_user
      @questions = @current_user.questions

  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      redirect_to "/questions"
    else
      #do something else, it's fucked up!
    end
  end
end
