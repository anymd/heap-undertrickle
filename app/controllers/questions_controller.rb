class QuestionsController < ApplicationController
  
  def new
    if is_logged_in?
      @question = Question.new(params[:user])
      render :new
    else
      flash[:error] = "Must be signed in to create a question."
      redirect_to :root
    end
  end

  def index

      @questions = Question.all

  end

  def create
    @user = current_user
    @question = @user.questions.new(params[:question])
    if @question.save
      redirect_to "/questions"
    else
      #do something else, it's fucked up!
    end
  end
end

