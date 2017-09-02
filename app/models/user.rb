class User < ApplicationRecord
  before_save { self.email = self.email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
#   validates :name, presence: true, length: { maximum: 50 }
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
  validates :phone_number, 
      presence: true,
      uniqueness: true
  validates :password, 
      length: { minimum: 6 },
      presence: true
  has_secure_password
  has_many :alerts
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
