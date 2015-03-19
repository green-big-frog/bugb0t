require 'configatron'
#This is the config file! Please copy this file to config.rb before editing!

#the Bot nick
configatron.nick = 'bugb0t'
#the Server to connect to
configatron.server = 'irc.freenode.net'
#the channels to join
configatron.channels = ["#botwar", "#dogecoin-bots", "#dogecoindark", "##dogechat", "#bugb0t"]
#the realname of the bot
configatron.realname = "Github: https://github.com/green-big-frog/bugb0t"
#the user f.e. ~ILOVEFROG@[host]
configatron.user = "ILOVEFROG"
#delay joins so that there isn't always a changing host reconnect from the IRC server
configatron.delay_joins = :identified
#set how ofter the bot should max write
configatron.messages_per_second = 0.2

#the nick of the admin
configatron.admin.nick = "green-big-frog"

#options for lmgtfy
configatron.options.lmgtfy.username = ""
configatron.options.lmgtfy.api_key = ""

#options for identify
configatron.options.identify.username = "testb0t"
configatron.options.identify.password = ""
#which type of identifying f.e. Nickserv, Quakeserv etc
configatron.options.identify.type = :nickserv
