require_relative 'spec_helper'

describe SixDegrees::User do
  let(:user) { SixDegrees::User.new(username: "ladygaga")}

  it 'has a username attribute' do
    expect(user.username).to be_a String
  end
  it 'has a mentions attribute' do
    expect(user.mentions).to be_an Array
  end
  it 'has a connections attribute' do
    expect(user.connections).to be_an Array
  end
end
