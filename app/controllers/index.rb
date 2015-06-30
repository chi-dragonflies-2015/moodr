
get '/' do
  redirect '/happy/birthday/Alyssa'
end

get '/happy/birthday/Alyssa' do
  redirect '/happy/birthday/Alyssa/chicago'
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
  @mood_data = @mood.data_hash
  @mood.save
  erb :index
end

get '/happy/birthday/Alyssa/sf' do
  #SF#
  @sf_tweets = []
  client.search(/./, lang: "en", geocode: "37.777119,-122.419640,300mi").take(200).each do |tweet|
    @sf_tweets << tweet.text
  end
  @sf = Location.find_by(city: "San Francisco")
  @mood = Mood.new
  @mood.location_id = @sf.id
  @mood.score = @mood.mood_scorer(@sf_tweets)
  @mood.happy_words = @mood.happy_counter
  @mood.sad_words = @mood.sad_counter
  @mood.save
  erb :index
end

get '/happy/birthday/Alyssa/ny' do
  #New York#
  @ny_tweets = []
  client.search(/./, lang: "en", geocode: "40.7127,-74.0059,300mi").take(200).each do |tweet|
    @ny_tweets << tweet.text
  end
  @ny = Location.find_by(city: "New York")
  @mood = Mood.new
  @mood.location_id = @ny.id
  @mood.score = @mood.mood_scorer(@ny_tweets)
  @mood.happy_words = @mood.happy_counter
  @mood.sad_words = @mood.sad_counter
  @mood.save
    erb :index
end
