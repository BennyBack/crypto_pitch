class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :create_profile
  validates :first_name, :last_name, :phone_number,:email, :presence => true
  validates :phone_number :uniqueness => true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :alerts
  has_many :identities


end
