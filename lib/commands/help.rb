require 'telegram/bot'
require_relative '../remby_bot'

class Help
  @help = {}

  def initialize
    @help = { start: 'Start remby_bot when you whant',
              stop: 'Send remby_bot to sleep',
              help: 'You are seeing it!',
              joke: 'Remby_bot is a good fella so if you are sad or just want to have fun use this command' }
  end

  def display_help
    help = ''
    @help.each do |key, value|
      help += "/#{key}: #{value}\n\n"
    end
    help
  end
end
