class TwitterService
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = "k8Qh8NHsi6jqLcMHUAt9Y90V7"
      config.consumer_secret = "deNvCLrGBVBC4dNBVAOt0h0Bsx1uMk2Nf8otb2xZaoelqoMCUx"
      config.access_token = "3876495681-S0gNzAmATPGnhYneRptdoOlWISPQOFguxa9qnAO"
      config.access_token_secret = "euoStsRfh6JljzZGrmTrRlFOmVVg6BTHGJj68kRap5dK1"
    end
  end

  def tweet(message)
    @client.update(message)
  end
end
