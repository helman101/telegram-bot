require 'telegram/bot'

# rubocop:disable Layout/LineLength
class Drink
  attr_accessor :bot, :message

  def initialize(bot, message)
    @bot = bot
    @message = message
    @links = ['https://www.bbcgoodfood.com/howto/guide/what-are-health-benefits-drinking-water',
              'https://www.medicalnewstoday.com/articles/290814',
              'https://www.healthline.com/health/food-nutrition/why-is-water-important',
              'https://www.webmd.com/diet/features/6-reasons-to-drink-water#1',
              'https://familydoctor.org/hydration-why-its-so-important/',
              'https://www.health.harvard.edu/staying-healthy/how-much-water-should-you-drink']
  end

  def random
    @links = @links.sample
  end

  def answer
    bot.api.send_message(chat_id: message.chat.id, text: "Nice question #{message.from.first_name}, you should see the link below for more information about the importance of drinking water\n #{random}")
  end
end
# rubocop:enable Layout/LineLength
