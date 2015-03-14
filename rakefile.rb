task default: %w[test]

task :test do
  require 'cinch'
  ruby "bot.rb"
end
