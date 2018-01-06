CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
    :region                 => 'ap-northeast-1'
  }
  
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }


  config.fog_directory = 'youniversity' 
   config.asset_host = 'https://youniversity.s3.amazonaws.com'
   config.fog_public
   config.cache_storage = :fog
  config.fog_directory = 'youniversity' if Rails.env.development?

  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
end

