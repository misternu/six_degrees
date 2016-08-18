require_relative 'spec_helper'

describe SixDegrees::Tweet do
  let(:usernames) { ["foo", "bar"]}
  let(:tweet) { SixDegrees::Tweet.new(mentions: usernames) }
  describe 'mentions' do
    it 'has mentions' do
      expect(tweet.mentions).to be_an Array
    end
  end
end
