CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJTMYSSQNAMLOTE4A',
    :aws_secret_access_key  => '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',
    :region                 => 'ap-northeast-1'
  }
  
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }


  config.fog_directory = 'youniversity' 
   config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/youniversity'
   
   config.cache_storage = :fog
  #config.fog_directory = 'your_backet_for_dev' if Rails.env.development?

  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
end

