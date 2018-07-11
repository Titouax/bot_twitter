require 'pry'
require 'dotenv'
Dotenv.load
require 'twitter'

client = Twitter::Streaming::Client.new do |config|
 config.consumer_key        = ENV["TWITTER_API_KEY"]
 config.consumer_secret     = ENV["TWITTER_API_SECRET"]
 config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
 config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]
end


topics = ["coffee", "tea"]
client.filter(track: topics.join(",")) do |object|
  puts "tweet"
  puts object.text if object.is_a?(Twitter::Tweet)
  puts " "
end
