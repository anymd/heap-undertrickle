class QuestionsController < ApplicationController

  def new
    if is_logged_in?
      @question = Question.new()
      respond_to do |format|
        format.html #new.html.erb
        format.json { render :json => @post}
      end
    else
      flash[:error] = "Must be signed in to create a question."
      redirect_to :root
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html  { redirect_to(@question,
                      :notice => 'Question was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @question.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def index
    @questions = Question.all
  end

  def create
    @user = current_user
    @question = @user.questions.new(params[:question])
    respond_to do |format|
      if @question.save
       format.html  { redirect_to(@question,
                      :notice => 'Question was successfully created.') }
        format.json  { render :json => @quesiton,
                      :status => :created, :location => @question }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @question.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def show
    @question = Question.find(params[:id])

    @vote = @question.votes.find_by_user_id(current_user.id)

    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @question }
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  def upvote
    @question = Question.find(params[:question_id])

    question_vote = Vote.find_by_user_id_and_voteable_id(current_user.id, @question.id)

    if question_vote

      if question_vote.vote == true
        question_vote.update_attributes(:vote => nil)
      else
        question_vote.update_attributes(:vote => true)
      end

    else
      vote = @question.votes.build(:vote => true)
      vote.user = current_user
      vote.save
    end

    redirect_to @question

  end

  def downvote
    @question = Question.find(params[:question_id])

    question_vote = Vote.find_by_user_id_and_voteable_id(current_user.id, @question.id)

    if question_vote

      if question_vote.vote == false
        question_vote.update_attributes(:vote => nil)
      else
        question_vote.update_attributes(:vote => false)
      end

    else
      vote = @question.votes.build(:vote => false)
      vote.user = current_user
      vote.save
    end

    redirect_to @question

  end

end



