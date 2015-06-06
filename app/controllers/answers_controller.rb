class AnswersController < ApplicationController


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
    @answer = Answer.find(answer [:id])
    @answer.destroy
    redirect_to questions_path
  end
end
