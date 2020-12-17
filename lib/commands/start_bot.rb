require 'telegram/bot'

# rubocop:disable Layout/LineLength
class StartBot
  attr_reader :bot, :message

  def initialize(bot, message)
    @bot = bot
    @message = message
  end

  def answer
    bot.api.send_message(chat_id: message.chat.id, text: "Hi!, #{message.from.first_name} ,nice to meet you, my name is remby_bot, my pleasure is help you to remember drink water. Use  /help to get more information about the commands!")
  end
end
# rubocop:enable Layout/LineLength
