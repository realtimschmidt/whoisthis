require 'rails_helper'

RSpec.describe Quiz, type: :model do
  let(:title) { Faker::Name.title}
  let(:quiz) { Quiz.create!(title: title)}

  it { is_expected.to have_many(:cards) }

  describe "attributes" do
    it "has a title attribute" do
      expect(quiz).to have_attributes(title: title)
    end
  end
end
