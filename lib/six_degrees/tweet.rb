module SixDegrees
  # class for a Tweet
  class Tweet
    attr_reader :sender, :mentions
    def initialize(data = {})
      @sender = data.fetch(:sender, '')
      @mentions = data.fetch(:mentions, [])
      @sender.add_tweet(self)
    end
  end
end
