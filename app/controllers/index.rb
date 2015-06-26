get '/' do


  @tweets = []
  client.search(/./, lang: "en", geocode: "41.884251,-87.632446,300mi").take(10).each do |tweet|
    @tweets << tweet.text
  end



  @tweets1 = []
  client.search(/./, lang: "en", geocode: "37.777119,-122.419640,300mi").take(10).each do |tweet|
    @tweets1 << tweet.text
  end
  erb :index

  # @tweets2 = []
  # client.search(/./, result_type: "recent", locations: "New York", lang: "en").take(200).each do |tweet|
  #   @tweets2 << tweet.text
  # end
  # erb :index
end
