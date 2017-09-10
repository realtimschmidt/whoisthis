require 'rails_helper'

RSpec.describe TakequizzesController, type: :controller do
  let(:my_quiz) { Quiz.create!(title: Faker::Name.title) }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns my_quiz to @quizzes" do
      get :index
      expect(assigns(:quizzes)).to eq([my_quiz])
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, {id: my_quiz.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: my_quiz.id}
      expect(response).to render_template :show
    end

    it "assigns my_quiz to @quiz" do
      get :show, {id: my_quiz.id}
      expect(assigns(:quiz)).to eq(my_quiz)
    end
  end
end
