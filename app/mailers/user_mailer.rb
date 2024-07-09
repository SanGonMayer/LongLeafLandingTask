class UserMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def loan_application_email(loan)
    @loan = loan
    pdf_generator = PdfGenerator.new(@loan)
    attachments['loan_application.pdf'] = pdf_generator.generate
    mail(to: @loan.email, subject: 'Gracias por enviar el formulario')
  end
end
