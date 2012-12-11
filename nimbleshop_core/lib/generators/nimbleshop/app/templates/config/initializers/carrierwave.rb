class S3Compliance
  def initialize(key)
    @key = key
  end
  def raise_error
    raise %Q{ This application's #{Rails.env} environment is configured to use amazon s3.
      However #{@key} to use is not specified at config/nimbleshop.yml .  }
  end
end

if Nimbleshop.config.use_s3

  unless bucket_name = Nimbleshop.config.s3.bucket_name
    S3Compliance.new('bucket_name').raise_error
  end

  unless aws_access_key_id = Nimbleshop.config.s3.access_key_id
    S3Compliance.new('aws_access_key_id').raise_error
  end

  unless secret_access_key = Nimbleshop.config.s3.secret_access_key
    S3Compliance.new('secret_access_key').raise_error
  end

  CarrierWave.configure do |config|
    config.cache_dir = "#{Rails.root}/tmp/uploads"
    config.storage = :fog
    config.enable_processing = true
    config.fog_directory  = bucket_name
    config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}
    config.fog_public     = true

    config.fog_credentials = {
        provider:               'AWS',
        aws_access_key_id:      aws_access_key_id,
        aws_secret_access_key:  secret_access_key,
        region:                 Nimbleshop.config.s3.region
      }
  end

else

  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = true
  end

end
