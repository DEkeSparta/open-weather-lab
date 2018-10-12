require 'dotenv'
require "json"
require "httparty"
require_relative '../lib/weather_api.rb'

Dotenv.load(".env")

RSpec.configure do |config|
  config.color = true
  # config.formatter = :documentation
end
