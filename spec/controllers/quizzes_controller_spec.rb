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
      expect(assigns(:quizzes)).to eq([my_quiz])
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
      expect(assigns(:quiz)).to eq(my_quiz)
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


  describe "GET #edit" do
    it "returns http success" do
      get :edit, {id: my_quiz.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, {id: my_quiz.id}
      expect(response).to render_template :edit
  end

    it "assigns quiz to be updated to @quiz" do
      get :edit, {id: my_quiz.id}

      quiz_instance = assigns(:quiz)

      expect(quiz_instance.id).to eq my_quiz.id
      expect(quiz_instance.title).to eq my_quiz.title
    end
  end

  describe "PUT update" do
    it "updates quiz with expected attributes" do
      new_title = Faker::Name.title

      put :update, id: my_quiz.id, quiz: {title: new_title}

      updated_quiz = assigns(:quiz)
      expect(updated_quiz.id).to eq my_quiz.id
      expect(updated_quiz.title).to eq new_title
    end

    it "redirects to the updated quiz" do
      new_title = Faker::Name.title

      put :update, id: my_quiz.id, quiz: {title: new_title}
      expect(response).to redirect_to my_quiz
    end
  end

  describe "DELETE destroy" do
    it "deletes the quiz" do
      delete :destroy, {id: my_quiz.id}
      count = Quiz.where({id: my_quiz.id}).size
      expect(count).to eq 0
    end

    it "redirects to quizzes index" do
      delete :destroy, {id: my_quiz.id}
      expect(response).to redirect_to quizzes_path
    end
  end
end
