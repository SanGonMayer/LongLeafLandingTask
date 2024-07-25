require 'telegram/bot'
require 'prawn'

class TelegramBot
  TOKEN = '7282064589:AAG5weCr4XRP1dvszuYy2iipre1n-X0OMhY'

  @step = :address
  @user_data = {}

  def self.run
    Telegram::Bot::Client.run(TOKEN) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          @step = :address
          @user_data = {}
          bot.api.send_message(chat_id: message.chat.id, text: 'Hey! Welcome to our loan calculator! Just follow the steps! Please enter the property address:')
        else
          handle_message(bot, message)
        end
      end
    end
  end

  def self.handle_message(bot, message)
    case @step
    when :address
      @user_data[:address] = message.text
      bot.api.send_message(chat_id: message.chat.id, text: 'Great! Now, enter the loan term in months:')
      @step = :loan_term
    when :loan_term
      @user_data[:loan_term] = message.text
      bot.api.send_message(chat_id: message.chat.id, text: 'Enter the purchase price:')
      @step = :purchase_price
    when :purchase_price
      @user_data[:purchase_price] = message.text
      bot.api.send_message(chat_id: message.chat.id, text: 'Enter the estimated repair budget:')
      @step = :repair_budget
    when :repair_budget
      @user_data[:repair_budget] = message.text
      bot.api.send_message(chat_id: message.chat.id, text: 'Enter the after repair value (ARV):')
      @step = :arv
    when :arv
      @user_data[:arv] = message.text
      bot.api.send_message(chat_id: message.chat.id, text: 'Enter your full name:')
      @step = :name
    when :name
      @user_data[:name] = message.text
      bot.api.send_message(chat_id: message.chat.id, text: 'Enter your email:')
      @step = :email
    when :email
      @user_data[:email] = message.text
      bot.api.send_message(chat_id: message.chat.id, text: 'Enter your phone number:')
      @step = :phone
    when :phone
      @user_data[:phone] = message.text
      loan = Loan.new(@user_data)
      pdf_path = generate_pdf(loan)
      send_pdf(bot, message.chat.id, pdf_path)
      bot.api.send_message(chat_id: message.chat.id, text: 'Thank you! Your PDF has been generated and sent. If you want to start over, type /start')
      @step = nil
    end
  end

  def self.generate_pdf(loan)
    pdf_generator = PdfGenerator.new(loan)
    pdf_path = "loan_application_#{loan.address.gsub(' ', '_')}.pdf"
    pdf_content = pdf_generator.generate
    File.open(pdf_path, 'wb') { |file| file.write(pdf_content) }
    pdf_path
  end

  def self.send_pdf(bot, chat_id, pdf_path)
    bot.api.send_document(chat_id: chat_id, document: Faraday::UploadIO.new(pdf_path, 'application/pdf'))
  end
end
