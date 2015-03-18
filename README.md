# bugb0t

[![Build Status](https://travis-ci.org/green-big-frog/bugb0t.svg?branch=master)](https://travis-ci.org/green-big-frog/bugb0t)
[![Code Climate](https://codeclimate.com/github/green-big-frog/bugb0t/badges/gpa.svg)](https://codeclimate.com/github/green-big-frog/bugb0t)


This is my little IRC bot! I am trying to learn Ruby with the cool Cinch framework and my bot!

bugb0t has a channel at freenode:
	[irc.freenode.net #bugb0t](https://kiwiirc.com/client/irc.freenode.net/#bugb0t)
	
###Getting Started
To get started on Ubuntu (and similar OS) you need to do following:  
1. Install ruby (at least 1.9.1) and bundle (and git if you haven't done that already) `sudo apt-get install ruby bundler git`  
2. clone the repo: `git clone https://github.com/green-big-frog/bugb0t.git`  
3. Install all requirments: `sudo bundle install`  
4. Copy the config file: `cp example.config.rb config.rb`  
5. Edit the config file with your favourite text editor: `nano config.rb`  
6. run `ruby bot.rb`  

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
