class Business < ApplicationRecord
  belongs_to :category
  belongs_to :user
 
  validates :name, presence: true
  validates :amount, presence: true
 end
 