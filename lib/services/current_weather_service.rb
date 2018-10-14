require "httparty"
require "json"

class CurrentWeatherServiceSingle
  include HTTParty
  attr_accessor :city_weather

  base_uri "https://api.openweathermap.org/data/2.5"

  def get_city_weather_by_name city, country = ""
    if country != ""
      country = ","+country
    end
    @city_weather = JSON.parse self.class.get("/weather?q=#{city}#{country}&APPID=#{ENV["WEATHER_API_KEY"]}").body
  end

  def get_city_weather_by_id id
    @city_weather = JSON.parse self.class.get("/weather?id=#{id}&APPID=#{ENV["WEATHER_API_KEY"]}").body
  end

  def get_city_weather_by_lat_long lat, long
    @city_weather = JSON.parse self.class.get("/weather?lat=#{lat}&lon=#{long}&APPID=#{ENV["WEATHER_API_KEY"]}").body
  end

  def get_city_weather_by_zip zip, country
    @city_weather = JSON.parse self.class.get("/weather?zip=#{zip},#{country}&APPID=#{ENV["WEATHER_API_KEY"]}").body
  end

  def get_value_of key
    return @city_weather[key]
  end

  def get_weather_property key
    return @city_weather["weather"].first[key]
  end

  def get_main_property key
    return @city_weather["main"][key]
  end

  def get_wind_property key
    return @city_weather["wind"][key]
  end

  def get_sys_property key
    return @city_weather["sys"][key]
  end

end
