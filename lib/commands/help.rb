require 'telegram/bot'

class Help
  attr_accessor :bot, :message

  def initialize(bot, message)
    @bot = bot
    @message = message
    @help = { start: 'Start remby_bot when you whant',
              stop: 'Send remby_bot to sleep',
              help: 'You are seeing it!',
              joke: 'Remby_bot is a good fella so if you are sad or just want to have fun use this command' }
  end

  def display_help
    descriptions = ''
    @help.each do |key, value|
      descriptions += "/#{key}: #{value}\n\n"
    end
    descriptions
  end

  def answer
    commands = display_help
    bot.api.send_message(chat_id: message.chat.id, text: commands.to_s)
  end
end
