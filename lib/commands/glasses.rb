require 'telegram/bot'
# rubocop:disable Layout/LineLength

class Glasses
  attr_accessor :bot, :message

  def initialize(bot, message)
    @bot = bot
    @message = message
  end

  def answer
    question = 'how many glasses of water did you drink today?'
    kb = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: [['I drink less than 8 glasses'], ['I drink more than 8 glasses'], ['I drink 8 glasses of water'], ['Wait what?!, i have to drink water?']], one_time_keyboard: true)
    bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: kb)
    bot.listen do |response|
      case response.text
      when 'I drink less than 8 glasses'
        @reply = 'Oh, i see, you should drink more water today.'
        break
      when 'I drink more than 8 glasses'
        @reply = 'Wow, calm down cowboy, water is good but you dont have to exaggerate'
        break
      when 'I drink 8 glasses of water'
        @reply = 'Great job, you drink the corrent amount of water'
        break
      when 'Wait what?!, i have to drink water?'
        @reply = "What are you an alien?!.\nGo, drink water, dont waste your time"
        break
      end
    end
    bot.api.send_message(chat_id: message.chat.id, text: @reply.to_s)
  end
end

# rubocop:enable Layout/LineLength
