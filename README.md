# bugb0t

[![Join the chat at https://gitter.im/green-big-frog/bugb0t](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/green-big-frog/bugb0t?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![Build Status](https://travis-ci.org/green-big-frog/bugb0t.svg?branch=master)](https://travis-ci.org/green-big-frog/bugb0t)
[![Code Climate](https://codeclimate.com/github/green-big-frog/bugb0t/badges/gpa.svg)](https://codeclimate.com/github/green-big-frog/bugb0t)


This is my little IRC bot! I am trying to learn Ruby with the cool Cinch framework and my bot!

bugb0t has a channel at freenode:
	[irc.freenode.net #bugb0t](https://kiwiirc.com/client/irc.freenode.net/#bugb0t)
	
###Getting Started
To get started on Ubuntu (and similar OS) you need to do following:  
1. Install ruby (at least 1.9.1) and rubygems (and git if you haven't done that already) `sudo apt-get install ruby rubygems git`  
2. check you have at least ruby 1.9.1 `ruby -v`  
3. Install bundler `sudo gem install bundler`  
4. clone the repo: `git clone https://github.com/green-big-frog/bugb0t.git && cd bugb0t`  
5. Install all requirments: `sudo bundle install`  
6. Copy the config file: `cp example.config.rb config.rb`  
7. Edit the config file with your favourite text editor: `nano config.rb`  
8. run `ruby bot.rb`  

If something errors msg me on IRC or look at the output of f.e. bundler!

TODO:
- [ ] Check for host of user for administration
- [ ] lots more

Thanks to the Makers of:
* https://github.com/compactcode/cinch_hangman
* https://github.com/compactcode/cinch_joker
* https://github.com/netfeed/cinch-lmgtfy
* https://github.com/Gizmokid2005/swissircbot
* https://github.com/Quintus/cinch-plugins
* https://github.com/jurgemaister/turid
