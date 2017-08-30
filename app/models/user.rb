class User < ActiveRecord::Base
  has_many :quizzes, dependent: :destroy
  before_save { self.role ||= :standard }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: [:standard, :admin]
end
