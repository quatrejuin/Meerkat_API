# Tell Devise to not use the ActionDispatch::Flash middleware.
Devise.setup do |config|
  config.navigational_formats = [ :json ]
end