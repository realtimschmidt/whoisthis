require 'rails_helper'

RSpec.describe Card do
  let(:photo) {'image_sample.jpg'}
  let(:name) {Faker::Name.title}
  let(:role) {Faker::Job.title}
  let(:company) {Faker::Company.name}
  let(:city) {Faker::Address.city}
  let(:school) {Faker::Educator.university}
  let(:title) {Faker::Name.title}
  let(:quiz) { Quiz.create!(title: title) }
  let(:card) { quiz.cards.create!(photo: photo, name: name, role: role, company: company, city: city, school: school)}

  it { is_expected.to belong_to(:quiz) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:photo) }

  describe "attributes" do
    it "has photo, name, role, city, and school attributes" do
      expect(card).to have_attributes(photo: photo, name: name, role: role, company: company, city: city, school: school)
    end
  end
end
