require_relative '../lib/commands/drink_water'
require_relative '../lib/commands/help'
require_relative '../lib/commands/glasses'
require_relative '../lib/commands/start_bot'
require_relative '../lib/commands/stop_bot'
require_relative '../lib/message_helper'
require_relative '../bin/main'

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

describe MessageHelper do
  subject { described_class.new(bot, message) }
  let(:bot) { double }
  let(:api) { double }

  context 'when start' do
    let(:message) { '/start' }
    let(:start_message) { instance_double StartBot }

    it 'start bot' do
      expect(StartBot).to receive(:new).with(bot, message).and_return start_message
      expect(start_message).to receive(:answer)
      subject.help_message
    end
  end

  context 'when stop' do
    let(:message) { '/stop' }
    let(:stop_message) { instance_double StopBot }

    it 'stop bot' do
      expect(StopBot).to receive(:new).with(bot, message).and_return stop_message
      expect(stop_message).to receive(:answer)
      subject.help_message
    end
  end

  context 'when help' do
    let(:message) { '/help' }
    let(:command_message) { instance_double Help }

    it 'show help' do
      expect(Help).to receive(:new).with(bot, message).and_return command_message
      expect(command_message).to receive(:answer)
      subject.help_message
    end
  end

  context 'when glasses' do
    let(:message) { '/glasses' }
    let(:glasses_message) { instance_double Glasses }

    it 'Give link to user' do
      expect(Glasses).to receive(:new).with(bot, message).and_return glasses_message
      expect(glasses_message).to receive(:answer)
      subject.help_message
    end
  end

  context 'when Why drink water is important?' do
    let(:message) { 'Why drink water is important?' }
    let(:drink_message) { instance_double Drink }

    it 'Ask a question to user' do
      expect(Drink).to receive(:new).with(bot, message).and_return drink_message
      expect(drink_message).to receive(:answer)
      subject.help_message
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
