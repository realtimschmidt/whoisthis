require 'rails_helper'

RSpec.describe QuizzesController, type: :controller do
  let(:my_quiz) { Quiz.create!(title: Faker::Name.title)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_quiz] to @quizzes" do
      get :index
      expect(assigns(:quizs)).to eq([my_quiz])
    end
  end

  describe "GET #show" do
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
      expect(assings(:quiz)).to eq(my_quiz)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @quiz" do
      get :new
      expect(assigns(:quiz)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases number of Quiz by 1" do
      expect{post :create, quiz: {title: Faker::Name.title}}.to change(Quiz,:count).by(1)
    end

    it "assigns the new post to @quiz" do
      post :create, quiz: {title: Faker::Name.title}
      expect(assigns(:quiz)).to eq Quiz.last
    end

    it "redirects to the new quiz" do
      post :create, quiz: {title: Faker::Name.title}
      expect(response).to redirect_to Quiz.last
    end
  end


#  describe "GET #edit" do
#    it "returns http success" do
#      get :edit
#      expect(response).to have_http_status(:success)
#    end
#  end

end
