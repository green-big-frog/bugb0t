# bundle requirments
require 'rubygems'
require 'bundler/setup'

# configatron
require 'configatron'
require './config.rb'

require 'optparse'
require 'cinch'
require 'cinch_hangman'
require 'cinch/plugins/identify'
require 'cinch/plugins/lmgtfy'

# Dir["./plugins/*.rb"].each {|file| require file }
Dir['./plugins/*.rb'].each { |file| require file }

# The Test Bot
def start_test_bot
  test_bot = Cinch::Bot.new do
    configure_test_bot
  end
  on :connect do
    puts 'aborting'
    exit
  end
  puts 'starting TestBot'
  test_bot.start
  puts 'started bot'
end

# Configure the test Bot
def configure_test_bot
  configure do |c|
    c.nick = configatron.nick
    c.server = configatron.server
    c.plugins.plugins = [
      Cinch::Plugins::PluginManagement,
      Cinch::Plugins::LMGTFY,
      Cinch::Plugins::Identify,
      Cinch::Plugins::Joker,
      Cinch::Plugins::Hangman,
      Cinch::Plugins::Help,
      Cinch::Plugins::Quotes,
      Cinch::Plugins::Catfact,
      Cinch::Plugins::Administration,
      Cinch::Plugins::Pirate
    ]
  end
end

# Enable the running of bot.rb with options, f.e. -t for travis testing
options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: ruby bot.rb [options]'

  opts.on('-t', '--test', 'Run testmode') do
    puts 'running test mode'
    start_test_bot
  end
end.parse!

p options
p ARGV

# The real Bot
bot = Cinch::Bot.new do
  file = open('/tmp/bot.log', 'a')
  file.sync = true
  loggers.push(Cinch::Logger::FormattedLogger.new(file))
  loggers.first.level = :log

  configure do |c|
    c.nick = configatron.nick
    c.server = configatron.server
    c.channels = configatron.channels
    c.realname = configatron.realname
    c.user = configatron.user
    c.delay_joins = configatron.delay_joins
    c.messages_per_second = configatron.messages_per_second
    c.plugins.plugins = [
      Cinch::Plugins::PluginManagement,
      Cinch::Plugins::LMGTFY,
      Cinch::Plugins::Identify,
      Cinch::Plugins::Joker,
      Cinch::Plugins::Hangman,
      Cinch::Plugins::Help,
      Cinch::Plugins::Quotes,
      Cinch::Plugins::Catfact,
      Cinch::Plugins::Administration,
      Cinch::Plugins::Pirate
    ]
    c.plugins.options = {
      Cinch::Plugins::LMGTFY => {
        'username' => configatron.options.lmgtfy.username,
        'api_key' => configatron.options.lmgtfy.api_key
      },

      Cinch::Plugins::Identify => {
        username: configatron.options.identify.username,
        password: configatron.options.identify.password,
        type: configatron.options.identify.type
      }
    }
  end
end

bot.start
