require 'rails_helper'

RSpec.describe Card do
  let(:name) {Faker::Name.title}
  let(:role) {Faker::Job.title}
  let(:company) {Faker::Company.name}
  let(:city) {Faker::Address.city}
  let(:school) {Faker::Educator.university}
  let(:title) {Faker::Name.title}
  let(:quiz) { Quiz.create!(title: title) }
  let(:card) { quiz.cards.create!(name: name, role: role, company: company, city: city, school: school)}

  it { is_expected.to belong_to(:quiz) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:role) }
  it { is_expected.to validate_presence_of(:company) }

  describe "attributes" do
    it "has photo, name, role, city, and school attributes" do
      expect(card).to have_attributes(name: name, role: role, company: company, city: city, school: school)
    end
  end
end
