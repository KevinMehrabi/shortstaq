class AnswersController < ApplicationController
include SessionsHelper

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(params.require(:answer).permit(:title, :body))
    @answer.user_id = session[:user_id]
      if @answer.save
        redirect_to questions_path
      else
        flash[:notice] = "Your answer is too long. It must be 200 characters max."
        render :_form
      end
  end


  def destroy
    @answer = Answer.find(params[:id])
    @user = @answer.user_id
      if @user == current_user.id
        @answer.destroy
      end
    redirect_to questions_path
  end
end
