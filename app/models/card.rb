class Card < ActiveRecord::Base
  belongs_to :quiz

  validates :image, presence: true
  validates :name, presence: true
end
