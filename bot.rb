require 'cinch'
require 'cinch_hangman'

Dir["./plugins/*.rb"].each {|file| require file }

bot = Cinch::Bot.new do

  file = open("/tmp/bot.log", "a")
  file.sync = true
  loggers.push(Cinch::Logger::FormattedLogger.new(file))
  loggers.first.level = :debug

  configure do |c|
    c.nick = "bugb0t"
    c.server = "irc.freenode.net"
    c.channels = ["#botwar", "#dogecoin-bots", "#dogecoindark", "##dogechat", "#bugb0t"]
    c.realname = "Github Repo: https://github.com/green-big-frog/bugb0t"
    c.user = "ILOVEFROG"
    c.delay_joins = :identified
    c.messages_per_second = 0.2
    c.plugins.plugins = [
    	Cinch::Plugins::PluginManagement,
    	Cinch::Plugins::LMGTFY,
    	Cinch::Plugins::Identify,
    	Cinch::Plugins::Joker,
    	Cinch::Plugins::Hangman,
    	Cinch::Plugins::Help,
    	Cinch::Plugins::Quotes,
    	Cinch::Plugins::Catfact,
    	Cinch::Plugins::Administration#,
    	#Cinch::Plugins::Pirate
	#Remove these 3x # if you want to have !pirate enabled! The problem for me is/was that !pirate doen't check till now if there's a \* what allows to exploit a bot if there's a tipbot in the channel (Thanks to buzz from IRC for finding still if he used it!)
    	]
    c.plugins.options = {
      Cinch::Plugins::LMGTFY => {
        "username" => "",
        "api_key" => ""
      },
      
      Cinch::Plugins::Identify => {
      	:username => "bugb0t",
      	:password => "",
      	:type     => :nickserv,
      }
    }
  end
end

bot.start
