# app/services/pdf_generator.rb
class PdfGenerator
  attr_reader :loan, :calculator, :pdf, :document_width

  def initialize(loan)
    @loan = loan
    @calculator = LoanCalculator.new(loan)
    @pdf = Prawn::Document.new
    @document_width = @pdf.bounds.width
  end

  def generate
    header
    user_information
    calculated_information
    pdf.render
  end

  private

  def header
    pdf.text "Loan Application", size: 24, style: :bold, align: :center, color: '006400'
    pdf.move_down 20
  end

  def user_information
    pdf.move_down 20
    PdfFormatter.add_section_header(pdf, "User Information")

    data = [
      ["Field", "Value"],
      ["Address", loan.address],
      ["Loan Term (in months)", loan.loan_term],
      ["Purchase Price", "$#{'%.2f' % loan.purchase_price}"],
      ["Repair Budget", "$#{'%.2f' % loan.repair_budget}"],
      ["After Repair Value (ARV)", "$#{'%.2f' % loan.arv}"],
      ["Name", loan.name],
      ["Email", loan.email],
      ["Phone", loan.phone]
    ]

    PdfFormatter.add_table(pdf, data, document_width)
  end

  def calculated_information
    pdf.move_down 20
    PdfFormatter.add_section_header(pdf, "Calculated Information")

    data = [
      ["Field", "Value"],
      ["Loan Amount Based on Purchase Price (90%)", "$#{'%.2f' % calculator.loan_amount_based_on_purchase_price}"],
      ["Loan Amount Based on ARV (70%)", "$#{'%.2f' % calculator.loan_amount_based_on_arv}"],
      ["Total Loan Value", "$#{'%.2f' % calculator.total_loan_value}"],
      ["Total Interest Expense", "$#{'%.2f' % calculator.total_interest_expense}"],
      ["Estimated Profit", "$#{'%.2f' % calculator.estimated_profit}"]
    ]

    PdfFormatter.add_table(pdf, data, document_width)
  end
end
