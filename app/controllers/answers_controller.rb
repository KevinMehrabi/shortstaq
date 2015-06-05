class AnswersController < ApplicationController
  def index
    @answers = Answer.all
  end

  def show
    @answer = Answer.find(params[:id])
  end


  def new
    @answer = Answer.new
  end


  def create
    @answer = Answer.new(params.require(:answer).permit(:title, :body))
      if @answer.save
        redirect_to answers_path
      else
        render :new
      end
  end


  def edit
    @answer = Answer.find(params[:id])
  end


  def update
    @answer = Answer.find(params[:id])

    if @answer.update_attributes(params.require(:answer).permit(:title,:body))
      redirect_to answers_path
    else
      render :edit
    end
  end


  def destroy
    @answer = Answer.find( answer [:id])
    @answer.destroy
    redirect_to answer_path
  end
end
