# config/initializers/koala.rb

module Facebook
	CONFIG = YAML.load_file( "#{Rails.root}/config/facebook.yml" )[Rails.env]
	APP_ID = {:User => CONFIG['user_app_id'], :ShopAdmin => CONFIG['shopadmin_app_id'], :Admin => CONFIG['admin_app_id'] }
	SECRET = {:User => CONFIG['user_secret_key'], :ShopAdmin => CONFIG['shopadmin_secret_key'], :Admin => CONFIG['admin_secret_key'] }
  PERMISSIONS = {:User => CONFIG['user_permissions'].split(","), :ShopAdmin => CONFIG['shopadmin_permissions'].split(","), :Admin => CONFIG['admin_permissions'].split(",") }
	CALLBACK_URL = CONFIG['callback_url']
  CHECKIN_URL = CONFIG['checkin_url']
  BASE_URL = CONFIG['base_url']
  AUTH_ERROR_REDIRECT = {
    :User => CONFIG['auth_error_redirect_checkin'],
    :ShopAdmin => CONFIG['auth_error_redirect_shopadmin']
  }
end

Koala::Facebook::OAuth.class_eval do
	def initialize_with_default_settings(*args)
	case args.size
	when 0, 1
	raise "application id and/or secret are not specified in the config" unless Facebook::APP_ID && Facebook::SECRET
	initialize_without_default_settings(Facebook::APP_ID.to_s, Facebook::SECRET.to_s,Facebook::CALLBACK_URL.to_s)
	when 2, 3
	initialize_without_default_settings(*args)
	end
	end

	alias_method_chain :initialize, :default_settings
end


