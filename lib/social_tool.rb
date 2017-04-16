module SocialTool
	def self.twitter_search
		client = Twitter::Streaming::Client.new do |config|
		  config.consumer_key        = ENV.fetch("TWITTER_CONSUMER_KEY")
		  config.consumer_secret     = ENV.fetch("TWITTER_CONSUMER_SECRET")
		  config.access_token        = ENV.fetch("TWITTER_ACCESS_TOKEN")
		  config.access_token_secret = ENV.fetch("TWITTER_ACCESS_SECRET")
		end

		client.search("#food", result_type: 'recent').take(6).collect do |tweet|
			"#{tweet.user.screen_name}: #{tweet.text}"
		end
	end
end

#TWITTER_CONSUMER_KEY=
#TWITTER_CONSUMER_SECRET=
#TWITTER_ACCESS_TOKEN=
#TWITTER_ACCESS_SECRET=