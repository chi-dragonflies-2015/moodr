class Mood < ActiveRecord::Base
  belongs_to :location
  # before_save :method_that_sets_to_zero
  attr_accessor :happy_counter, :sad_counter


    $happy_words = ["happy", "grateful", "joyful", "smiling", "awesome", "fuck yeah!", "woo!", "yea!!", "yay", "great", "excellent", "kowabunga!", "Terrific!", "Wonderful", "terrific", "sappy", "optimistic", "adorable", "admired", "alive", "amazing", "blessed", "brilliant", "cheerful", "delictious", "elegant", "exciting", "fun", "impressive", "lucky", "weee", "glee", "fun", "amazing", "thank"]
    $sad_words = ["gloomy","tragic","depressive", "bleeding", "bummed out", "crummy", "dejected", "fed up", "glum", "grim", "low-spirited", "melancholy", "moody", "pessimistic", "sad", "unhappy", "death", "dead", "fear", "ruined", "lonely", "miserable", "anxious", "grief", "sorrow", "crying", "pathetic", "terrified", "scared","alone", "damnit", "sucks", "hate", "fuck", "shit", "mad", "pissed", "angry"]


  # def mood_scorer(tweet)
  #   self.happy_words.each do |word|
  #     if tweet.include?(word)
  #       happy_counter += 1
  #     end
  #   end

  #   self.sad_words.each do |word|
  #     if tweet.include?(word)
  #       sad_counter += 1
  #     end
  #   end


  # end


  def mood_scorer(tweets_array)
    self.happy_counter = 0
    self.sad_counter = 0
    tweets_array.each do |tweet|
      $happy_words.each do |word|
        if tweet.include?(word)
          self.happy_counter += 1
        end
      end
      $sad_words.each do |word|
        if tweet.include?(word)
          self.sad_counter += 1
        end
      end
    end
    self.happy_counter - self.sad_counter
  end

end
