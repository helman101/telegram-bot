require_relative '../lib/message_helper'

token = '1489570711:AAGhIHN0jjxLXA1yXtlZAPvyc0tYH5LLcCc'

class Remby
  def start_bot(token)
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        new_message = MessageHelper.new(bot, message)
        new_message.help_message
      end
    end
  end
end
