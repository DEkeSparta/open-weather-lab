describe CurrentWeatherServiceMultiple do

  before :all do
    @cur_weather = WeatherAPI.current_weather_multiple
  end

  context "by lat, long and number" do

    before :all do
      @count = 2
      @test_weather = @cur_weather.get_cities_weather_by_lat_long 33.5, -86.8, @count
    end

    it "should return a code of 200" do
      expect(@cur_weather.get_value_of "cod").to eq "200"
    end

    it "should have a message string" do
      expect(@cur_weather.get_value_of "message").to be_a String
    end

    it "should return a count that is the same as the input count" do
      expect(@cur_weather.get_value_of "count").to eq @count
    end


    include_examples "multiple weather tests"

  end

  context "by multiple ids" do

    before :all do
      @test_weather = @cur_weather.get_cities_weather_by_ids 4049979, 4095415
      @count = @cur_weather.get_value_of("list").length
    end

    it "should return a count that is the same as the input count" do
      expect(@cur_weather.get_value_of "cnt").to eq @count
    end

    include_examples "multiple weather tests"

  end

end
