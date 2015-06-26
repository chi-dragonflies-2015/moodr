get '/' do
  client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "vaENW1Csec23bA6077AHWLoAy"
  config.consumer_secret     = "4x6FsXiiQG4nmp2b4eT6fgWqIKl9teMo1chOR8qqtmz5ILXAqi"
  config.access_token        = "32813528-GUg4eTRcBxuisJWImOFr7qUCydjhdRvk3D6XHeoin"
  config.access_token_secret = "lpglpvbfYLZUOeeyAizegdHriWFokuPjcn8BeaZwHxVsy"
end

#Chicago#
  @chicago_tweets = []
  client.search(/./, lang: "en", geocode: "41.884251,-87.632446,300mi").take(200).each do |tweet|
    @chicago_tweets << tweet.text
  end
  @chicago = Location.create(city: "Chicago", state: "Illinois")
  @mood = Mood.new
  @mood.location_id = @chicago.id
  @mood.score = @mood.mood_scorer(@chicago_tweets)
  @mood.happy_words = @mood.happy_counter
  @mood.sad_words = @mood.sad_counter
  @mood.save

#SF#
  # @sf_tweets = []
  # client.search(/./, lang: "en", geocode: "37.777119,-122.419640,300mi").take(10).each do |tweet|
  #   @sf_tweets << tweet.text
  # end


#New York#
  # @ny_tweets = []
  # client.search(/./, result_type: "recent", locations: "New York", lang: "en").take(200).each do |tweet|
  #   @ny_tweets << tweet.text
  # end



  erb :index
end
