task default: %w[test]

task :test do
  ruby "bot.rb"

notifications:
  irc: "chat.freenode.net#bugb0t"
end
