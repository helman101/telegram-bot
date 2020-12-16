require_relative '../lib/commands/drink_water'
require_relative '../lib/commands/help'
require_relative '../lib/commands/glasses'
require_relative '../lib/commands/start_bot'
require_relative '../lib/commands/stop_bot'
require_relative '../lib/message_helper'
require_relative '../lib/bot'

token = '1489570711:AAGhIHN0jjxLXA1yXtlZAPvyc0tYH5LLcCc'

describe Remby do
  subject { Telegram::Bot::Client }

  describe 'start_bot' do
    it 'runs the telegram bot' do
      should receive(:run).with(token)
      Remby.new.start_bot(token)
    end

    it 'runs listener in the bot' do
      expect_any_instance_of(Telegram::Bot::Client).to receive(:listen)
      Remby.new.start_bot(token)
    end
  end
end

describe Help do
  subject { described_class.new(bot, message) }
  let(:bot) { double }
  let(:api) { double }
  let(:message) { double }

  describe '#display_help' do
    it 'return a string with the bot commands' do
      expect(subject.display_help).to be_an(String)
    end
  end
end

describe Drink do
  subject { described_class.new(bot, message) }
  let(:bot) { double }
  let(:api) { double }
  let(:message) { double }

  describe '#random' do
    it 'return a String' do
      expect(subject.random).to_not be_an(Numeric)
    end

    it 'return a link' do
      expect(subject.random).to include('https')
    end
  end
end
