require 'dotenv'
require "json"
require "httparty"
require_relative '../lib/weather_api.rb'
require_relative "single_weather_tests"
require_relative "multiple_weather_tests"

Dotenv.load(".env")

RSpec.configure do |config|
  config.color = true
  # config.formatter = :documentation
end
