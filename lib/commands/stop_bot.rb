require 'telegram/bot'

class StopBot
  attr_accessor :bot, :message

  def initialize(bot, message)
    @bot = bot
    @message = message
  end

  def answer
    bot.api.send_message(chat_id: message.chat.id, text: "See you next time, #{message.from.first_name}", date: message.date)
  end
end
