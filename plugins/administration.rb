require 'cinch'

module Cinch
  module Plugins
    class Administration
      include Cinch::Plugin
      
      set :prefix, /^!/
      
      timer 300, :method => :fix_nick
      
      match /join\s+(#[#\w\d_-]+)/, method: :join
      match /part\s+(#[#\w\d_-]+)/, method: :part
      match /say (\S+) (.*)/, method: :say
      match /op (\S+) (\S+)/, method: :op
      match /deop (\S+) (\S+)/, method: :deop
      match /kick (\S+) (\S+)(.*)?/, method: :kick
      match /conf reload/, method: :conf_reload
      match /nick (\S+)/, method: :nick

      def join(m, channel)
        m
        bot.join channel
      end

      def part(m, channel)
        m
        bot.part channel
      end

      def say(m, channel, message)
        m
        Channel("##{channel}").privmsg(message)
      end

      def op(m, channel, user)
        m
        Channel("##{channel}").op(user)
      end

      def deop(m, channel, user)
        m
        Channel("##{channel}").deop(user)
      end

      def kick(m, channel, user, reason)
        m
        reason ||= "Fuck off!"
        Channel("##{channel}").kick(user, reason)
      end

      def conf_reload (m)
        m
        $conf = Settings.new("config.json")
      end

      def nick(m, nick)
        m
        bot.nick = nick
        $conf.nick = nick
      end

      def fix_nick
        unless bot.nick == $conf.nick
          bot.nick = $conf.nick
        end
      end
      
      
      
    end
  end
end

