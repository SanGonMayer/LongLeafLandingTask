# app/services/loan_calculator.rb
class LoanCalculator
  attr_reader :loan

  def initialize(loan)
    @loan = loan
  end

  def loan_amount_based_on_purchase_price
    loan.purchase_price * 0.9
  end

  def loan_amount_based_on_arv
    loan.arv * 0.7
  end

  def total_loan_value
    [loan_amount_based_on_purchase_price, loan_amount_based_on_arv].min
  end

  def total_interest_expense
    total_loan_value * ((1 + monthly_interest_rate)**loan.loan_term - 1)
  end

  def estimated_profit
    loan.arv - total_loan_value - total_interest_expense
  end

  private

  def monthly_interest_rate
    0.13 / 12
  end
end
