require 'telegram/bot'
require_relative 'commands/drink_water'
require_relative 'commands/help'

# rubocop:disable Layout/LineLength

class Bot
  def initialize
    token = '1489570711:AAGhIHN0jjxLXA1yXtlZAPvyc0tYH5LLcCc'
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hi!, #{message.from.first_name} , nice to meet you, my name is remby_bot, my pleasure is help you to remember drink water. Use  /help to get more information about the commands!")
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "See you next time, #{message.from.first_name}", date: message.date)
        when '/help'
          help = Help.new
          commands = help.display_help
          bot.api.send_message(chat_id: message.chat.id, text: commands.to_s)
        when 'Why drink water is important?'
          drink = Drink.new
          link = drink.random
          bot.api.send_message(chat_id: message.chat.id, text: "Nice question #{message.from.first_name}, you should see the link below for more information about the importance of drinking water\n #{link}")
        else
          bot.api.send_message(chat_id: message.chat.id, text: "What?!, english please!\n If you want to know my commands use /help")
        end
      end
    end
  end
end
# rubocop:enable Layout/LineLength
