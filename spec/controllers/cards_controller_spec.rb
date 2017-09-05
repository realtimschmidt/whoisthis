require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  let(:my_quiz) { Quiz.create!(title: Faker::Name.title) }
  let(:my_card) { my_quiz.cards.create!(image: 'face.jpg', name: Faker::Name.title, role: Faker::Job.title, city: Faker::Address.city, school: Faker::Educator.university) }

  describe "GET show" do
    it "returns http success" do
      get :show, quiz_id: my_quiz.id, id: my_card.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, quiz_id: my_quiz.id, id: my_card.id
      expect(response).to render_template :show
    end

    it "assigns my_card to @card" do
      get :show, quiz_id: my_quiz.id, id: my_card.id
      expect(assigns(:card)).to eq(my_card)
    end
  end

  describe "GET new" do
    it "returns http succes" do
      get :new, quiz_id: my_quiz.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, quiz_id: my_quiz.id
      expect(response).to render_template :new
    end

    it "initializes @card" do
      get :new, quiz_id: my_quiz.id
      expect(assigns(:card)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of Card by 1" do
      expect{post :create, quiz_id: my_quiz.id, card: {image: 'face.jpg', name: Faker::Name.title, role: Faker::Job.title, city: Faker::Address.city, school: Faker::Educator.university}}.to change(Card,:count).by(1)
    end

    it "assigns the new card to @card" do
      post :create, quiz_id: my_quiz.id, card: {image: 'face.jpg', name: Faker::Name.title, role: Faker::Job.title, city: Faker::Address.city, school: Faker::Educator.university}
      expect(assigns(:card)).to eq Card.last
    end

    it "redirects to the new card" do
      post :create, quiz_id: my_quiz.id, card: {image: 'face.jpg', name: Faker::Name.title, role: Faker::Job.title, city: Faker::Address.city, school: Faker::Educator.university}
      expect(response).to redirect_to [my_quiz, Card.last]
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, quiz_id: my_quiz.id, id: my_card.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, quiz_id: my_quiz.id, id: my_card.id
      expect(response).to render_template :edit
    end

    it "assigns card to be updated to @card" do
      get :edit, quiz_id: my_quiz.id, id: my_card.id
      card_instance = assigns(:card)

      expect(card_instance.id).to eq my_card.id
      expect(card_instance.name).to eq my_card.name
      expect(card_instance.image).to eq my_card.image
      expect(card_instance.city).to eq my_card.city
      expect(card_instance.role).to eq my_card.role
      expect(card_instance.school).to eq my_card.school
    end
  end

  describe "PUT update" do
    it "updates card with expected attributes" do
      new_image = "better_face.jpg"
      new_name = Faker::Name.title
      new_role = Faker::Job.title
      new_city = Faker::Address.city
      new_school = Faker::Educator.university

      put :update, quiz_id: my_quiz.id, id: my_card.id, card: {image: new_image, name: new_name, role: new_role, city: new_city, school: new_school}

      updated_card = assigns(:card)
      expect(updated_card.id).to eq my_card.id
      expect(updated_card.name).to eq new_name
      expect(updated_card.image).to eq new_image
      expect(updated_card.city).to eq new_city
      expect(updated_card.role).to eq new_role
      expect(updated_card.school).to eq new_school
    end

    it "redirects to the updated post" do
      new_image = "face.jpg"
      new_name = Faker::Name.title
      new_role = Faker::Job.title
      new_city = Faker::Address.city
      new_school = Faker::Educator.university

      put :update, quiz_id: my_quiz.id, id: my_card.id, card: {image: 'face.jpg', name: Faker::Name.title, role: Faker::Job.title, city: Faker::Address.city, school: Faker::Educator.university}

      expect(response).to redirect_to [my_quiz, my_card]
    end
  end

  describe "DELETE destroy" do
    it "deletes the card" do
      delete :destroy, quiz_id: my_quiz.id, id: my_card.id
      count = Card.where({id: my_card.id}).size
      expect(count).to eq 0
    end

    it "redirects to quiz show" do
      delete :destroy, quiz_id: my_quiz.id, id: my_card.id
      expect(response).to redirect_to my_quiz
    end
  end
end
