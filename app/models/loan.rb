class Loan < ApplicationRecord
  validates :address, :loan_term, :purchase_price, :repair_budget, :arv, :name, :email, :phone, presence: true
end
