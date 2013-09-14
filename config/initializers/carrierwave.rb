#-*- encoding: utf-8 -*-
 
if Rails.env.production?
  CarrierWave.configure do |config|
    config.cache_dir = "#{Rails.root}/tmp/uploads"
    config.storage                          = :fog
    config.fog_credentials                  = {
        :provider              => 'AWS',
        :aws_access_key_id     => ENV["AWS_S3_KEY_ID"],
        :aws_secret_access_key => ENV["AWS_S3_SECRET_KEY"],
        :region                 => 'ap-northeast-1'               
    }
    config.fog_directory                    = ENV["AWS_S3_BUCKET"]
    config.fog_public                       = true
    #config.fog_authenticated_url_expiration = 60
    config.fog_attributes = {'Cache-Control'=>'max-age=82800'}   
    #config.fog_host       = 'https://s3.amazonaws.com'
    config.asset_host       = 'https://s3.amazonaws.com'

  end

else
  CarrierWave.configure do |config|
    config.storage = :file
  end
end


