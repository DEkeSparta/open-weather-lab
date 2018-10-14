require "httparty"
require "json"

class CurrentWeatherServiceMultiple
  include HTTParty
  attr_accessor :_many_city_weather

  base_uri "https://api.openweathermap.org/data/2.5"

  def get_cities_weather_by_lat_long lat, long, count
    @many_city_weather = JSON.parse self.class.get("/find?lat=#{lat}&lon=#{long}&cnt=#{count}&APPID=#{ENV["WEATHER_API_KEY"]}").body
  end

  def get_cities_weather_by_ids *ids
    id_list = ids * ","
    @many_city_weather = JSON.parse self.class.get("/group?id=#{id_list}&APPID=#{ENV["WEATHER_API_KEY"]}").body
  end

  def get_value_of key
    return @many_city_weather[key]
  end

  def get_each_value_of key
    return @many_city_weather["list"].map {|k| k[key]}
  end

  def get_each_coord_property key
    return @many_city_weather["list"].map {|k| k["coord"][key]}
  end

  def get_each_weather_property key
    return @many_city_weather["list"].map {|k| k["weather"].first[key]}
  end

  def get_each_main_property key
    return @many_city_weather["list"].map {|k| k["main"][key]}
  end

  def get_each_wind_property key
    return @many_city_weather["list"].map {|k| k["wind"][key]}
  end

end
