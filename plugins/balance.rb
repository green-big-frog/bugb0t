require 'cinch'

module Cinch
  module Plugins
    class Balance
      include Cinch::Plugin
      
      match("balance", method: :execute)
      def execute(m)
    	m.reply "!balance"
      end

      match(/zero (\S+)(?: (\S+))?/, method: :executetwo)
      def executetwo(m, amount)
    	m.reply "!tip green-big-frog #{amount}"
      end
    end
  end
end

