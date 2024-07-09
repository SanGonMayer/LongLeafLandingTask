class LoansController < ApplicationController
  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(loan_params)
    if @loan.save
      UserMailer.loan_application_email(@loan).deliver_now
      redirect_to root_path, notice: 'Loan application submitted successfully.'
    else
      render :new
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:address, :loan_term, :purchase_price, :repair_budget, :arv, :name, :email, :phone)
  end
end
