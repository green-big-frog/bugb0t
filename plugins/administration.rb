require 'cinch'

module Cinch
  module Plugins
    class Administration
      include Cinch::Plugin
      
      set :prefix, /^!/
      
      match /join\s+(#[#\w\d_-]+)/, method: :join
      match /part\s+(#[#\w\d_-]+)/, method: :part
      match /say (\S+) (.*)/, method: :say
      match /msg (\S+) (.+)/, method: :msg
      match /op (\S+) (\S+)/, method: :op
      match /deop (\S+) (\S+)/, method: :deop
      match /kick (\S+) (\S+)(.*)?/, method: :kick
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

      def msg(m, receiver, message)
        m
        User(receiver).send(message)
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

      def nick(m, nick)
        m
        bot.nick = nick
        $conf.nick = nick
      end
    end
  end
end

