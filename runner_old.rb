# Get all the tweets in an array of hashes
tweets = []
File.open('sample_input.txt') do |f|
  tweets = f.map do |line|
    {
      user: line[/^\w+(?=:)/],
      mentions: line.scan(/(?<=@)\w+/)
    }
  end
end

# Get all the users that are mentioned by users
mentions = {}
tweets.each do |tweet|
  mentions[tweet[:user]] ||= []
  mentions[tweet[:user]] += tweet[:mentions]
  mentions[tweet[:user]] = mentions[tweet[:user]].uniq
end
p mentions

# Get only the users that mention you back
connections = Hash[mentions.map { |k, _| [k, []] }]
mentions.keys.combination(2) do |a, b|
  if mentions[a].include?(b) && mentions[b].include?(a)
    connections[a] << b
    connections[b] << a
  end
end
p connections

# For each user
connections.keys.each do |user|
  # Say the username
  puts user
  # Don't count themselves as a potential connection
  covered = [user]
  # Their connections are the first layer
  layer = connections[user]
  # Until the layer we are on is empty
  until layer == []
    # Print who is in it
    puts layer.join(', ')
    # Add them to the connections we have already found
    covered += layer
    # And replace layer with their connections minus what's covered
    layer = layer.flat_map { |u| connections[u] } .uniq - covered
  end
  puts
end
