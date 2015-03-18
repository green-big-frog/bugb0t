require 'configatron'

configatron.nick = 'bugb0t'
configatron.server = 'irc.freenode.net'
configatron.channels = ["#botwar", "#dogecoin-bots", "#dogecoindark", "##dogechat", "#bugb0t"]
configatron.realname = "Github: https://github.com/green-big-frog/bugb0t"
configatron.user = "ILOVEFROG"

configatron.options.lmgtfy.username = ""
configatron.options.lmgtfy.api_key = ""
configatron.options.identify.username = "testb0t"
configatron.options.identify.password = ""
configatron.options.identify.type = :nickserv
configatron.delay_joins = :identified
configatron.messages_per_second = 0.2
