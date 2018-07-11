# Voici ton programme

# Appelle la gem dotenv
require 'dotenv'

# Ceci appelle le fichier .env grâce à la gem dotenv, et enregistre toutes les données enregistrées dans une hash ENV
Dotenv.load

# Il est très facile d'appeler les données sensibles du fichier .env, par exemple là je vais afficher TWITTER_API_SECRET
puts ENV['TWITTER_API_SECRET']

# ligne très importante qui appelle la gem. Sans elle, le programme ne saura pas appeler Twitter
require 'twitter'

# quelques lignes qui enregistrent les clés d'APIs
client = Twitter::REST::Client.new do |config|
 config.consumer_key        = ENV["TWITTER_API_KEY"]
 config.consumer_secret     = ENV["TWITTER_API_SECRET"]
 config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
 config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]
end
p client
# ligne qui permet de tweeter
#client.update('Mon premier tweet en ruby !!!!')
