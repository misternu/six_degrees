# Class for twitter users
class User
  attr_reader :username, :mentions, :connections
  def initialize(data = {})
    @username = data.fetch(:username, '')
    @tweets = []
    @mentions = []
    @connections = []
  end

  def add_tweet(tweet)
    @tweets << tweet
    @mentions |= tweet.mentions
    new_connections(tweet)
  end

  def connect(user)
    @connections |= [user]
  end

  def new_connections(tweet)
    (tweet.mentions - connections).each do |user|
      user.mentions.include?(self) &&
        connect(user) &&
        user.connect(self)
    end
  end

  def inspect
    "<User @#{@username}>"
  end

  def self.find_or_create(username)
    all.find { |user| user.username == username } ||
      new(username: username)
  end

  def self.all
    # Temp solution until I replace with AR
    ObjectSpace.each_object(self).to_a.sort_by(&:username)
  end
end
