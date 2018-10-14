require_relative "services/current_weather_service.rb"
require_relative "services/current_weather_multiple.rb"

class WeatherAPI
  include HTTParty

  base_uri "https://api.openweathermap.org/data/2.5"

  Dotenv.load("../.env")

  def self.current_weather_single
    return CurrentWeatherServiceSingle.new
  end

  def self.current_weather_multiple
    return CurrentWeatherServiceMultiple.new
  end
end
