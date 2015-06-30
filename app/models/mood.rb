class Mood < ActiveRecord::Base
  belongs_to :location
  attr_accessor :happy_counter, :sad_counter, :used_words, :data_hash
  # $happy_words = ["happy", "grateful", "joyful", "smiling", "awesome", "fuck yeah!", "woo!", "yea!!", "yay", "great", "excellent", "kowabunga!", "Terrific!", "Wonderful", "terrific", "sappy", "optimistic", "adorable", "admired", "alive", "amazing", "blessed", "brilliant", "cheerful", "delictious", "elegant", "exciting", "fun", "impressive", "lucky", "weee", "glee", "fun", "amazing", "thank"]
  # $sad_words = ["gloomy", "tragic", "depressive", "bleeding", "bummed out", "crummy", "dejected", "fed up", "glum", "grim", "low-spirited", "melancholy", "moody", "pessimistic", "sad", "unhappy", "death", "dead", "fear", "ruined", "lonely", "miserable", "anxious", "grief", "sorrow", "crying", "pathetic", "terrified", "scared","alone", "damnit", "sucks", "hate", "fuck", "shit", "mad", "pissed", "angry"]
  $happy_words = ["great"]
  $sad_words = ["and"]

  def mood_scorer(tweets_array)
    self.happy_counter = 0
    self.sad_counter = 0
    self.used_words = []
    self.data_hash = {}
    tweets_array.each do |tweet|
      $happy_words.each do |word|
        if tweet.include?(word)
          self.used_words << word
          self.happy_counter += 1
        end
      end
      $sad_words.each do |word|
        if tweet.include?(word)
          self.used_words << word
          self.sad_counter += 1
        end
      end
    end
    self.data_hash = Hash[self.used_words.uniq.map {|v| [v, self.used_words.count(v)] }]
    # self.used_words.each{|word| self.data_hash[word] += 1}
    self.happy_counter - self.sad_counter
  end

end
