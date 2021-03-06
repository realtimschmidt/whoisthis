class CardsController < ApplicationController

  def show
    @card = Card.find(params[:id])
    @quiz = Quiz.find(params[:quiz_id])
  end

  def new
    @quiz = Quiz.find(params[:quiz_id])
    @card = Card.new
  end

  def create
    @card = Card.new
    @card.image = params[:card][:image]
    @card.photo = params[:card][:photo]
    @card.name = params[:card][:name]
    @card.role = params[:card][:role]
    @card.company = params[:card][:company]
    @card.city = params[:card][:city]
    @card.school = params[:card][:school]
    @quiz = Quiz.find(params[:quiz_id])
    @card.quiz = @quiz

    if @card.save
      flash[:notice] = "Card saved successfully."
      redirect_to [@quiz, @card]
    else
      flash[:alert] = "Card failed to save."
      render :new
    end
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    @card.image = params[:card][:image]
    @card.name = params[:card][:name]
    @card.role = params[:card][:role]
    @card.company = params[:card][:company]
    @card.city = params[:card][:city]
    @card.school = params[:card][:school]

    if @card.save
      flash[:notice] = "Card was updated."

      redirect_to [@card.quiz, @card]
    else
      flash.now[:alert] = "There was an error saving this card. Please try again."
      render :edit
    end
  end

  def destroy
    @card = Card.find(params[:id])

    if @card.destroy
      flash[:notice] = "\"#{@card.name}\" was deleted successfully."
      redirect_to @card.quiz
    else
      flash.now[:alert] = "There was an error deleting the card."
      render :show
    end
  end

  def card_params
    params.require(:photo).permit(:name)
  end
end
