require "httparty"
require_relative "services/current_weather_service.rb"

class WeatherAPI
  include HTTParty

  def self.current_weather
    return CurrentWeatherService.new
  end
end
