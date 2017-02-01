#build vote results
vote_results = []
4.times do |precinct_index|
  vote_results[precinct_index] = []
  3.times do |candidate_index|
    vote_results[precinct_index][candidate_index] = rand(20..500)
  end
end

candidates = [
  'Mary Sue',
  'Sally Jane',
  'Billy Joe'
]

#list out vote results
vote_results.each_with_index do |precinct_results, precinct_index|
  puts "**In precinct #{precinct_index + 1}:**"

  candidates.each_with_index do |candidate, candidate_index|
    puts "* #{candidate} got #{vote_results[precinct_index][candidate_index]} votes"
  end

  puts ""
end

### put your code here
counts = {
  'Mary Sue' => 0,
  'Sally Jane' => 0,
  'Billy Joe' => 0
}

puts "\nHow many people voted in precinct 1?"
puts vote_results[0].inject{ |sum, votes| sum += votes }

puts "\nWho was the winning candidate in Precinct 4?"
puts candidates[vote_results.index(vote_results.max)]

puts "\nHow many people voted for Mary Sue?"
vote_results.each { |precinct| counts['Mary Sue'] += precinct[0] }
puts counts['Mary Sue']

puts "\nHow many people voted for Billy Joe?"
vote_results.each { |precinct| counts['Billy Joe'] += precinct[2] }
puts counts['Billy Joe']

puts "\nHow many people voted for Sally Jane?"
vote_results.each { |precinct| counts['Sally Jane'] += precinct[1] }
puts counts['Sally Jane']

puts "\nHow many people voted in total?"
sum = 0
vote_results.each do |precinct|
  precinct.each do |votes|
    sum += votes
  end
end
puts sum

puts "\nWho had the most votes?"
puts "#{counts.max[0]} won with #{counts.max[1]} votes"

puts "\nvote_results:"
puts vote_results.inspect
puts "\nvote tallies:"
puts counts.inspect
