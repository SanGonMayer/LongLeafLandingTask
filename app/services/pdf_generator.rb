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
    PdfFormatter.add_logo(pdf)
    PdfFormatter.add_section_header(pdf, "Loan Application Summary")
  end

  def user_information
    pdf.move_down 1
    PdfFormatter.add_section_header(pdf, "User Information")

    data = [
      ["Field", "Value"],
      ["Address", loan.address],
      ["Loan Term (in months)", loan.loan_term],
      ["Purchase Price", PdfFormatter.format_currency(loan.purchase_price)],
      ["Repair Budget", PdfFormatter.format_currency(loan.repair_budget)],
      ["After Repair Value (ARV)", PdfFormatter.format_currency(loan.arv)],
      ["Name", loan.name],
      ["Email", loan.email],
      ["Phone", loan.phone]
    ]

    PdfFormatter.add_table(pdf, data, document_width)
  end

  def calculated_information
    pdf.move_down 5
    PdfFormatter.add_section_header(pdf, "Calculated Information")

    data = [
      ["Field", "Value"],
      ["Loan Amount Based on Purchase Price (90%)", PdfFormatter.format_currency(calculator.loan_amount_based_on_purchase_price)],
      ["Loan Amount Based on ARV (70%)", PdfFormatter.format_currency(calculator.loan_amount_based_on_arv)],
      ["Repair Budget", PdfFormatter.format_currency(loan.repair_budget)],
      ["Total Loan Value", PdfFormatter.format_currency(calculator.total_loan_value)],
      ["Total Interest Expense", PdfFormatter.format_currency(calculator.total_interest_expense)],
      ["Estimated Profit", PdfFormatter.format_currency(calculator.estimated_profit)]
    ]

    PdfFormatter.add_table(pdf, data, document_width)
  end
end
