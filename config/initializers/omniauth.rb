Rails.application.config.middleware.use OmniAuth::Builder do
  # https://stackoverflow.com/questions/11396233/authentication-failure-devise-omniauth-twitter/11426795
  # http://www.eggineer.info/entry/2018/02/13/125856
  # provider :twitter, ENV["TWITTER_API_KEY"], ENV["TWITTER_API_SECRET_KEY"]
end