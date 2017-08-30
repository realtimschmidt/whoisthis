require 'rails_helper'

RSpec.describe Card do
  let(:quiz) { Quiz.create!(title: "First Quiz")}
  let(:card) { Card.create!(image: 'someface.jpg', name: 'John Quizington', role: 'Zamboni Driver', city: 'Minneapolis', school: 'U of M', quiz: quiz)}

  describe "attributes" do
    it "has image, name, role, city, and school attributes" do
      expect(card).to have_attributes(image: 'someface.jpg', name: 'John Quizington', role: 'Zamboni Driver', city: 'Minneapolis', school: 'U of M')
    end
  end
end
