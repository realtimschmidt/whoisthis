require 'rails_helper'

RSpec.describe Quiz, type: :model do
  let(:quiz) { Quiz.create!(title: "First Quiz")}

  describe "attributes" do
    it "has a title attribute" do
      expect(quiz).to have_attributes(title: "First Quiz")
    end
  end
end
