class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    @user = current_user
  end

  def new
    @question = Question.new
  end


  def edit
    @question = Question.find(params[:id])
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to question_path(@question.id), notice:"your question #{@question.title} was sucessfully created"
    else
      redirect_to '/questions/new'
    end
  end

  def update
    @question = Question.find(params[:id])
      if @question.update(question_params)
        redirect_to question_path(@question.id), notice:"your answer #{@question.description} was sucessfully updated"
      else
         redirect_to "/answers/show"
      end
  end


   private
    def question_params
     params.require(:question).permit(:title, :description, :user_id)
    end
end
