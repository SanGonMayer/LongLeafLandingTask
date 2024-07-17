namespace :pdf do
  desc "Generate a preview of the loan application PDF"
  task preview: :environment do
    loan = Loan.new(
      address: "123 Main St",
      loan_term: 12,
      purchase_price: 250000,
      repair_budget: 50000,
      arv: 350000,
      name: "John Doe",
      email: "john.doe@example.com",
      phone: "1234567890"
    )
    PdfFormatter.create_pdf(loan)
    puts "PDF generated: loan_application.pdf"
  end
end
