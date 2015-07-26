CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAI2M7HJREDVRFI26Q',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'eu-west-1',                  # optional, defaults to 'us-east-1'
    host:                  '',             # optional, defaults to nil
    endpoint:              '' # optional, defaults to nil
  }
  config.fog_directory  = 'saragallery'                          # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end