class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true

  has_many :games, through: :players
  has_many :players
end
