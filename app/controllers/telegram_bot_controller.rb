# app/controllers/telegram_bot_controller.rb
class TelegramBotController < ApplicationController
  def start
    TelegramBot.run
    render plain: 'Telegram bot is running'
  end
end
