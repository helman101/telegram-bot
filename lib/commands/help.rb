require 'telegram/bot'

class Help
  attr_reader :bot, :message

  def initialize(bot, message)
    @bot = bot
    @message = message
    @help = { start: 'Start remby_bot when you whant',
              stop: 'Send remby_bot to sleep',
              help: 'You are seeing it!',
              glasses: 'remby will ask you a quesstion!',
              'Why drink water is important?' => 'Remby will give you an useful link' }
  end

  def display_help
    descriptions = ''
    @help.each do |key, value|
      descriptions += key.match('Why') ? "#{key}: #{value}\n\n" : "/#{key}: #{value}\n\n"
    end
    descriptions
  end

  def answer
    commands = display_help
    bot.api.send_message(chat_id: message.chat.id, text: commands.to_s)
  end
end
