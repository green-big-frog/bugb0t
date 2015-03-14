task default: %w[test]

task :test do
  ruby "bot.rb"
end

notifications:
  irc: "chat.freenode.net#bugb0t"
end
