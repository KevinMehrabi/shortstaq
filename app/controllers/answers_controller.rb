class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(params.require(:answer).permit(:title, :body))
    @answer.user_id = session[:user_id]
      if @answer.save
        redirect_to questions_path
      else
        render :new
      end
  end


  def destroy
    @answer = Answer.find(answer [:id])
    @answer.destroy
    redirect_to questions_path
  end
end
