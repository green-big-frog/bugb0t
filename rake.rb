task default: %w[test]

task :test do
  gem install cinch
  ruby "bot.rb"
end
