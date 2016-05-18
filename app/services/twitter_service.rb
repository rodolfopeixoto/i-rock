class TwitterService
  def initialize
  	@client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "GnKdcRm8jOUWbGfydSAirdaaF"
      config.consumer_secret     = "TJVCnlk8wt44OxaaO7Kf1O7qZjNlv4k3l3HToxE1uAalmVO00v"
      config.access_token        = "178120350-GBddKuvgNCmKRk9BO0DRwWtdsttxtOD6n6GhZKlo"
      config.access_token_secret = "qhGsOSWqZxYjEHngKmb61uvw5rOQspfEleGP06TYL9VQg"
  	end
  end

  def tweet(message)
  	@client.update(message)
  end
end