#!/usr/bin/env ruby

def substrings(phrase, dictionary)

  tally = Hash.new(0)
  dictionary.each do |word_to_count|
    phrase.split.each do |word_to_search|
      if word_to_search.downcase.include?(word_to_count)
        tally[word_to_count.downcase] += 1
      end
    end
  end
  return tally
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part",
              "partner","sit"]
p dictionary
p "below"
p substrings("below", dictionary)

p "Howdy partner, sit down! How's it going?"
p substrings("Howdy partner, sit down! How's it going?", dictionary)