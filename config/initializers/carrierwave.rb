CarrierWave.configure do |config|
 config.storage = :fog
 config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJGNWSU6ZCTPDBGBA',                        # required
    :aws_secret_access_key  => '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',    # required
    :region                 => 'us-west-2'
  }
  config.fog_directory  = "kikomatchup"                   # required
end