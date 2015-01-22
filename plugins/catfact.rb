require 'cinch'
require 'json'
require 'net/http'

module Cinch
	module Plugins
		class Catfact
		  include Cinch::Plugin

		  match "cat"

		  def execute(m)
		        uri = URI.parse("http://catfacts-api.appspot.com/api/facts?format=json")
      			Net::HTTP.start(uri.host, uri.port) do |http|

        		resp        = Net::HTTP.get_response(uri)
		  	parsed = JSON.parse(resp.body)		  	
		  	
		  	if parsed.include?('success')
          			facts     = parsed['facts']          			
          			m.reply Format(:green,"#{facts}")
          		
        		else
          			m.reply "Well...this was unexpected. No Catfact for you, sorry."
        		end
        		
		  	end
		  end
	end
end
end


