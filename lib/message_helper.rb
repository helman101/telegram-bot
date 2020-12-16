require 'telegram/bot'
require_relative 'commands/drink_water'
require_relative 'commands/help'
require_relative 'commands/glasses'
require_relative 'commands/start_bot'
require_relative 'commands/stop_bot'

# rubocop:disable Layout/LineLength
class MessageHelper
  attr_accessor :bot, :message

  def initialize(bot, message)
    @bot = bot
    @message = message
  end

  def help_message
    case message.text
    when '/start'
      StartBot.new(bot, message).answer
    when '/stop'
      StopBot.new(bot, message).answer
    when '/help'
      Help.new(bot, message).answer
    when 'Why drink water is important?'
      Drink.new(bot, message).answer
    when '/glasses'
      Glasses.new(bot, message).answer
    else
      bot.api.send_message(chat_id: message.chat.id, text: "What?!, english please!\nIf you want to know my commands use /help")
    end
  end
end
# rubocop:enable Layout/LineLength
