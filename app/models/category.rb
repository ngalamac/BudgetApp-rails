class Category < ApplicationRecord
    has_many :transactions
    has_one_attached :icon
  
    validates :name, presence: true
    validates :icon, presence: true
    def total_amount
        transactions.sum(:amount)
    end
end
