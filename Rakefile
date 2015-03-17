task default: %w[test]

task :test do
	cp example.config.rb config.rb
	ruby "bot.rb --test"
end
