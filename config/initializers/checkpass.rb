# config/initializers/checkpass.rb

module PAYPAL
	CONFIG = YAML.load_file( "#{Rails.root}/config/checkpass.yml" )[Rails.env]
  CHECKOUT_URL = CONFIG['paypal_checkout_url']
  CANCEL_URL = CONFIG['paypal_cancel_url']
  NOTIFY_URL = CONFIG['paypal_notify_url']
  ID = CONFIG['paypal_id']
end

