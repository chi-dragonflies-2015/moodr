get '/' do
  redirect '/happy/birthday/Alyssa'
end

get '/happy/birthday/Alyssa' do
   #drop down menu
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "vaENW1Csec23bA6077AHWLoAy"
    config.consumer_secret     = "4x6FsXiiQG4nmp2b4eT6fgWqIKl9teMo1chOR8qqtmz5ILXAqi"
    config.access_token        = "32813528-GUg4eTRcBxuisJWImOFr7qUCydjhdRvk3D6XHeoin"
    config.access_token_secret = "lpglpvbfYLZUOeeyAizegdHriWFokuPjcn8BeaZwHxVsy"
  end
  erb :index
end

get '/happy/birthday/Alyssa/chicago' do

  #Chicago#
  @chicago_tweets = []
  client.search(/./, lang: "en", geocode: "41.884251,-87.632446,300mi").take(200).each do |tweet|
    @chicago_tweets << tweet.text
  end
  @chicago = Location.find_by(city: "Chicago")
  @mood = Mood.new
  @mood.location_id = @chicago.id
  @mood.score = @mood.mood_scorer(@chicago_tweets)
  @mood.happy_words = @mood.happy_counter
  @mood.sad_words = @mood.sad_counter
  @mood.save
end

get '/happy/birthday/Alyssa/sf' do
  #SF#
  @sf_tweets = []
  client.search(/./, lang: "en", geocode: "37.777119,-122.419640,300mi").take(200).each do |tweet|
    @sf_tweets << tweet.text
  end
  @sf = Location.find_by(city: "San Francisco")
  @sf_mood = Mood.new
  @sf_mood.location_id = @sf.id
  @sf_mood.score = @sf_mood.mood_scorer(@sf_tweets)
  @sf_mood.happy_words = @sf_mood.happy_counter
  @sf_mood.sad_words = @sf_mood.sad_counter
  @sf_mood.save
end

get '/happy/birthday/Alyssa/ny' do
  #New York#
  @ny_tweets = []
  client.search(/./, lang: "en", geocode: "40.7127,-74.0059,300mi").take(200).each do |tweet|
    @ny_tweets << tweet.text
  end
  @ny = Location.find_by(city: "New York")
  @ny_mood = Mood.new
  @ny_mood.location_id = @ny.id
  @ny_mood.score = @ny_mood.mood_scorer(@ny_tweets)
  @ny_mood.happy_words = @ny_mood.happy_counter
  @ny_mood.sad_words = @ny_mood.sad_counter
  @ny_mood.save

end
