# frozen_string_literal: true

CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['ACCESS_KEY'],
      aws_secret_access_key: ENV['SECRET_KEY'],
      host: ENV['ASSET_HOST'],
      endpoint: ENV['END_POINT'],
      path_style: true
    }
    config.fog_public = true
    config.asset_host = ENV['ASSET_HOST']
    config.fog_attributes = { 'Cache-Control' => 'max-age=315576000' }
    config.storage = :fog
  end