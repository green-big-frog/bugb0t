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

	def is_admin?(user)
		true if user.nick == configatron.admin.nick
	end

      def join(m, channel)
        bot.join channel if is_admin?(m.user)
      end

      def part(m, channel)
        bot.part channel if is_admin?(m.user)
      end

      def say(m, channel, message)
        Channel("##{channel}").privmsg(message) if is_admin?(m.user)
      end

      def msg(m, receiver, message)
        User(receiver).send(message) if is_admin?(m.user)
      end

      def op(m, channel, user)
        Channel("##{channel}").op(user) if is_admin?(m.user)
      end

      def deop(m, channel, user)
        Channel("##{channel}").deop(user) if is_admin?(m.user)
      end

      def kick(m, channel, user, reason)
        reason ||= "Fuck off!"
        Channel("##{channel}").kick(user, reason) if is_admin?(m.user)
      end

      def nick(m, nick)
        bot.nick = nick if is_admin?(m.user)
        $conf.nick = nick
      end
    end
  end
end

