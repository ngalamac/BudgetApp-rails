class Business < ApplicationRecord
  has_many :categories, dependent: :destroy, foreign_key: :business_id
  belongs_to :user

  validates :name, presence: true
  validates :amount, presence: true
end
