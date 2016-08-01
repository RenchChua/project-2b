if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage    =  :aws                  # required
    config.aws_bucket =  ENV['S3_BUCKET']      # required
    config.aws_acl    =  :public_read


    config.aws_credentials = {
     access_key_id:      ENV['AWS_ACCESS_KEY_ID'],       # required
     secret_access_key:  ENV['AWS_SECRET_ACCESS_KEY'],     # required
     region:             ENV['AWS_REGION']
   }

  #  config.aws_attributes = {
  #                             'Cache-Control'=>"max-age=#{365.day.to_i}",
  #                             'Expires'=>'Tue, 29 Dec 2015 23:23:23 GMT'
  #                           }

    # config.fog_credentials = {
    #   # Configuration for Amazon S3
    #   :provider              => 'AWS',
    #   :aws_access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
    #   :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
    #   :region                => ENV['AWS_REGION']
    # }
    # config.fog_directory     =  ENV['S3_BUCKET']
  end
end
