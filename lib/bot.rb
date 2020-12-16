require_relative '../lib/message_helper'

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
