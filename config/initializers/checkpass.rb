# config/initializers/checkpass.rb

module Checkpass
	CONFIG = YAML.load_file( "#{Rails.root}/config/checkpass.yml" )[Rails.env]
  PAYPAL_CHECKOUT_URL = CONFIG['paypal_checkout_url']
  PAYPAL_CANCEL_URL = CONFIG['paypal_cancelurl']
  PAYPAL_NOTIFY_URL = CONFIG['paypal_notify_url']
  PAYPAL_ID = CONFIG['paypal_id']
end

