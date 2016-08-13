# Class for Parsing strings into Tweet objects
class TweetParser
  def self.parse(string)
    username = string[/^\w+(?=:)/]
    mentioned_usernames = string.scan(/(?<=@)\w+/)
    sender = User.find_or_create(username)
    mentions = mentioned_usernames.map do |name|
      User.find_or_create(name)
    end
    Tweet.new(sender: sender, mentions: mentions)
  end
end
