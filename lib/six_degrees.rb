require_relative 'six_degrees/dfs'
require_relative 'six_degrees/tweet'
require_relative 'six_degrees/tweet_parser'
require_relative 'six_degrees/user'

# module for finding connected users to the 6th degree
module SixDegrees
  def self.users(filename)
    File.readlines(filename).each do |string|
      TweetParser.parse(string)
    end
    User.all
  end
end
