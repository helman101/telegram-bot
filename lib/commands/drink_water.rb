require 'telegram/bot'
require_relative '../remby_bot'

class Drink
  @links = nil

  def initialize
    @links = ['https://www.bbcgoodfood.com/howto/guide/what-are-health-benefits-drinking-water',
              'https://www.medicalnewstoday.com/articles/290814',
              'https://www.healthline.com/health/food-nutrition/why-is-water-important',
              'https://www.webmd.com/diet/features/6-reasons-to-drink-water#1']
  end

  def random
    @links = @links.sample
  end
end
