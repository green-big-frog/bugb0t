require 'configatron'
# This is the config file! Please copy this file to config.rb before editing!

# The Bot nick
configatron.nick = 'bugb0t'
# The Server to connect to
configatron.server = 'irc.freenode.net'
# The channels to join
configatron.channels = [
  '#botwar',
  '#bugb0t']
# The realname of the bot
configatron.realname = 'Github: https://github.com/green-big-frog/bugb0t'
# The user f.e. ~ILOVEFROG@[host]
configatron.user = 'ILOVEFROG'
# Delay joins so that there isn't always a "changing host" reconnect
configatron.delay_joins = :identified
# Set how ofter the bot should max write
configatron.messages_per_second = 0.2

# The nick of the admin
configatron.admin.nick = 'greenbigfrog'

# Options for lmgtfy
configatron.options.lmgtfy.username = ''
configatron.options.lmgtfy.api_key = ''

# Options for identify
configatron.options.identify.username = 'testb0t'
configatron.options.identify.password = ''
# Which type of identifying f.e. Nickserv, Quakeserv etc
configatron.options.identify.type = :nickserv
