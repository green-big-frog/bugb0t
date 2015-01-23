require 'cinch'
require 'cinch_hangman'

Dir["./plugins/*.rb"].each {|file| require file }

bot = Cinch::Bot.new do
  configure do |c|
    c.nick = "bugb0t"
    c.server = "irc.freenode.net"
    c.channels = ["#botwar"]#, "#dogecoin-bots", "#dogecoindark", "##dogechat"]
    c.realname = "I am a Bot using the cool cinch framework!!!"
    #c.delay_joins = :identified
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
    	Cinch::Plugins::Administration,
    	Cinch::Plugins::Pirate
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
