source 'https://rubygems.org'

#gem 'rails', '3.2.11'
gem 'rails', '3.2.14'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development do
	gem 'sqlite3'
  gem 'mysql2'
end

group :test do
	gem 'pg','0.14.1'
end

group :production do
#	gem 'pg','0.14.1'
  gem 'mysql2'
end

group :development do
  #エラー画面をわかりやすく整形　Better Errors
  gem 'better_errors'
  #better_errors上にirb/pryを表示する
  gem 'binding_of_caller'
end

  gem 'binding_of_caller'

gem "koala", '1.6.0'
gem "multi_json"
gem 'execjs'


#group :development do
#	gem 'therubyracer','~> 0.10.2', :platform=>:ruby
#end
#group :test, :production do
	gem 'libv8','~> 3.3.10'
	gem 'therubyracer','~> 0.10.2'
  gem 'less-rails','=2.2.3'
#end

# Rails file uploader
gem 'carrierwave'

# Rails file uploader use  S3
#group :production do
  gem "fog",  "~> 1.3.1"
#end

# Gems used only for assets and not required
# in production environments by default.
#group :assets do
  gem 'turbo-sprockets-rails3'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'

  # use twitter-bootstrap-rails
  
  # use jquery-ui
#end

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery_mobile_rails'
gem 'twitter-bootstrap-rails','= 2.2.6'
gem 'spinjs-rails'

#use error_message_fot
gem 'dynamic_form'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

group :development,:test,:production do
  # Use unicorn as the app server
  gem 'unicorn'
  gem 'unicorn-worker-killer'
end

# Deploy with Capistrano
# gem 'capistrano'

group :development do
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'capistrano_colors'
  gem 'capistrano-unicorn'
end

# To use debugger
group :development do
  gem 'debugger'
end

#barby
gem 'rqrcode'
gem 'barby'
gem "chunky_png", "~> 1.2.8"


