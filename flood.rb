require "dotenv"
require "pry"
require "twitter"

Dotenv.load

# quelques lignes qui enregistrent les clés d'APIs
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["CONSUMER_KEY"]
  config.consumer_secret     = ENV["CONSUMER_SECRET"]
  config.access_token        = ENV["ACCES_TOKEN"]
  config.access_token_secret = ENV["ACCES_TOKEN_SECRET"]
end

# ligne qui permet de tweeter

# topics = ["the"]
# client.filter(track: topics.join(",")) do |object|
#   puts object.user.screen_name + " = "+ object.text if object.is_a?(Twitter::Tweet)
# end


client.search("Mon premier tweet en ruby !!!!").take(99).collect do |tweet|
	rep ="#{tweet.user.screen_name} Hey je fais THP a montpellier et j'envoi ce tweet avec mon bot :p"
	rep.insert(0, "@")
  client.update(rep)
end
