class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
    @card = @quiz.cards.sample
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new
    @quiz.title = params[:quiz][:title]

    if @quiz.save
      flash[:notice] = "Quiz was saved."
      redirect_to @quiz
    else
      flash.now[:alert] = "There was an error saving the quiz. Please try again."
      render :new
    end
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    @quiz.title = params[:quiz][:title]

    if @quiz.save
      flash[:notice] = "Quiz was updated."
      redirect_to @quiz
    else
      flash.now[:alert] = "There was an error saving the quiz. Please try again."
      render :edit
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])

    if @quiz.destroy
      flash[:notice] = "\"#{@quiz.title}\" was deleted successfully."
      redirect_to quizzes_path
    else
      flash.now[:alert] = "There was an error deleting the quiz."
      render :show
    end
  end
end
