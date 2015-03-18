#bundle requirments
require 'rubygems'
require 'bundler/setup'

#configatron
require 'configatron'
require './config.rb'

require 'optparse'
require 'cinch'
require 'cinch_hangman'
require "cinch/plugins/identify"
require 'cinch/plugins/lmgtfy'

Dir["./plugins/*.rb"].each {|file| require file }


def startTestBot
	testBot = Cinch::Bot.new do
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
		on :connect do |m|
			puts'aborting'
			exit
		end
	end
	puts'starting TestBot'
	testBot.start
	puts'started bot'
end

options = {}
OptionParser.new do |opts|
	opts.banner = "Usage: ruby bot.rb [options]"

	opts.on("-t", "--test", "Run testmode") do |test|
		puts'running test mode'
		startTestBot
	end
end.parse!

p options
p ARGV






bot = Cinch::Bot.new do

  file = open("/tmp/bot.log", "a")
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
        "username" => configatron.options.lmgtfy.username,
        "api_key" => configatron.options.lmgtfy.api_key
      },
      
      Cinch::Plugins::Identify => {
      	:username => configatron.options.identify.username,
      	:password => configatron.options.identify.password,
      	:type     => configatron.options.identify.type
      }
    }
  end
end

bot.start
