require 'cinch'
require 'json'
require 'net/http'

module Cinch
	module Plugins
		class Quotes
		  include Cinch::Plugin

		  match "quote"

		  def execute(m)
		        uri = URI.parse("http://www.iheartquotes.com/api/v1/random.json")
      			Net::HTTP.start(uri.host, uri.port) do |http|

        		resp        = Net::HTTP.get_response(uri)
		  	parsed = JSON.parse(resp.body)
		  	
		  	
		  	if parsed.include?('quote')

          			quote     = parsed['quote']
          			link     = parsed['link']
          			
          			m.reply Format(:bold,:teal,"#{quote}") + " (Permlink: #{link})"

        		elsif parsed.include?('response')

          			error       = parsed['response']['error']

          			m.reply "Sorry, the API returned an error!!!"

        		else

          			m.reply "Well...this was unexpected. No quote for you, sorry."

        		end
		  	end
		  end
	end
end
end


