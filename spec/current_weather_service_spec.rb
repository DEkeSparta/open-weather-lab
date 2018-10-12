describe "CurrentWeatherService" do

  before :all do
    @cur_weather = WeatherAPI.current_weather
  end

  context "by city name" do
    before :all do
      @test_weather = @cur_weather.get_city_weather_by_name "Birmingham"
      p @test_weather
    end

    include_examples "single weather tests"
  end

  context "by city id" do
    before :all do
      @test_weather = @cur_weather.get_city_weather_by_id 4049979
    end

    include_examples "single weather tests"
  end

  context "by coordinates" do
    before :all do
      @test_weather = @cur_weather.get_city_weather_by_lat_long -87, 33.5
    end

    include_examples "single weather tests"
  end

  context "by zip" do
    before :all do
      @test_weather = @cur_weather.get_city_weather_by_zip 94040,"us"
    end

    include_examples "single weather tests"
  end

end
