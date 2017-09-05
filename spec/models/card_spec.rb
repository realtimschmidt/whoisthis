require 'rails_helper'

RSpec.describe Card do
  let(:image) {"someface.jpg"}
  let(:name) {Faker::Name.title}
  let(:role) {Faker::Job.title}
  let(:city) {Faker::Address.city}
  let(:school) {Faker::Educator.university}
  let(:title) {Faker::Name.title}
  let(:quiz) { Quiz.create!(title: title) }
  let(:card) { quiz.cards.create!(image: image, name: name, role: role, city: city, school: school)}

  it { is_expected.to belong_to(:quiz) }

  it { is_expected.to validate_presence_of(:image) }
  it { is_expected.to validate_presence_of(:name) }

  describe "attributes" do
    it "has image, name, role, city, and school attributes" do
      expect(card).to have_attributes(image: image, name: name, role: role, city: city, school: school)
    end
  end
end
