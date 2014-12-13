require 'cinch'

module Cinch
  module Plugins
    class Help
      include Cinch::Plugin
      
      match "help"
      def execute(m)
    	m.reply "#{m.user.nick}, you requested help! My availlable plugins are lmgtfy, joker and hangman \nTo hear a joke do: !joke\nTo google for someone do !google [nick] [question]\nTo play hangman do !hang guess [letters]"
      end
    end
  end
end

