class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      puts "question was created"
      redirect_to '/questions/new'
    else
      redirect_to '/questions/new'
    end
  end

   private
    def question_params
     params.require(:question).permit(:title, :description, :user_id)
    end
end
