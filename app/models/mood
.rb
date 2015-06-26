class Mood < ActiveRecord::Base
  attr_accessor :happy_counter, :sad_counter

  def initialize
    @happy_counter = 0
    @happy_words = ["happy", "grateful", "joyful", "smiling", "awesome", "fuck yeah!", "woo!", "yea!!", "yay",
               "great!", "excellent!", "kowabunga!", "Terrific!", "Wonderful", "terrific", "sappy"]
  end



  def mood_scorer(tweet)
    self.happy_words.each do |word|
      if tweet.include?(word)
        happy_counter += 1
      end
    end

    self.sad_words.each do |word|
      if tweet.include?(word)
        sad_counter += 1
      end
    end


  end

end
