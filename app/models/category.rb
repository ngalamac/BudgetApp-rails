class Category < ApplicationRecord
  belongs_to :user
  has_many :businesses, dependent: :destroy
  has_one_attached :icon

  validates :name, presence: true
  validates :icon, presence: true

  def total_amount
    businesses.sum(:amount)
  end
end
