require_relative "services/current_weather_service.rb"

class WeatherAPI
  include HTTParty

  base_uri "https://api.openweathermap.org/data/2.5"

  Dotenv.load("../.env")

  def self.current_weather
    return CurrentWeatherService.new
  end
end
