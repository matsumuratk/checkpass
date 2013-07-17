# config/initializers/checkpass.rb

module PAYPAL
	CONFIG = YAML.load_file( "#{Rails.root}/config/checkpass.yml" )[Rails.env]
  CHECKOUT_URL = CONFIG['paypal_checkout_url']
  CANCEL_URL = CONFIG['paypal_cancel_url']
  NOTIFY_URL = CONFIG['paypal_notify_url']
  ID = CONFIG['paypal_id']
end

module PREVIEW_IMG
	CONFIG = YAML.load_file( "#{Rails.root}/config/checkpass.yml" )[Rails.env]
  EX_TOP_IMAGE = CONFIG['ex_top_image']
  EX_MIDDLE_IMAGE = CONFIG['ex_middle_image']
  EX_COUPON_IMAGE = CONFIG['ex_coupon_image']
  EX_WALL_PICTURE = CONFIG['ex_wall_picture']
end
