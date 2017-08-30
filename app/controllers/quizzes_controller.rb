class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
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
  end
end
