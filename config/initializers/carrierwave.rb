CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['s3_access_key'],
    aws_secret_access_key: ENV['s3_secret_access_key'],
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'youniversity'
  config.cache_storage = :fog
end