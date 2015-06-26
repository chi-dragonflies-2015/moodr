helpers do

def client
  Twitter::REST::Client.new do |config|
    config.consumer_key        = "vaENW1Csec23bA6077AHWLoAy"
    config.consumer_secret     = "4x6FsXiiQG4nmp2b4eT6fgWqIKl9teMo1chOR8qqtmz5ILXAqi"
    config.access_token        = "32813528-GUg4eTRcBxuisJWImOFr7qUCydjhdRvk3D6XHeoin"
    config.access_token_secret = "lpglpvbfYLZUOeeyAizegdHriWFokuPjcn8BeaZwHxVsy"
  end
end

end
