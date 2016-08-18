# There were problems with Tweet, it was too dependent on
# the behavior of User. It should be more of a primitive
# class that doesn't depend on anything, until and unless
# we add AR later.
module SixDegrees
  # class for a Tweet
  class Tweet
    attr_reader :mentions
    def initialize(data = {})
      @mentions = data.fetch(:mentions, [])
    end
  end
end
