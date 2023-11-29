class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
         validates :email, presence: true
         validates :password, presence: true
         validates :name, presence: true

  has_many :categories, dependent: :destroy
  has_many :businesses, through: :categories
end

