require 'cinch'

module Cinch
  module Plugins
    class Help
      include Cinch::Plugin
      
      match "help"
      def execute(m)
    	m.reply "#{m.user.nick}, you requested help!\tTo hear a joke do: !joke\tTo google for someone do !google [nick] [question]\tTo play hangman do !hang guess [letters]\tTo hear a Catfact: !cat\t To get a quote: !quote\tTo learn how to speak like a pirate: !pirate [Text]"
      end
    end
  end
end

