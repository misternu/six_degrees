require_relative 'tweet'
require_relative 'user'
require_relative 'tweet_parser'

File.readlines('sample_input.txt').each do |string|
  TweetParser.parse(string)
end

p User.all.first.connections
