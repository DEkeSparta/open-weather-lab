describe "CurrentWeatherService" do

  context "testing" do

    before :all do
      @cur_weather = WeatherAPI.current_weather
    end

    it "should say hi" do
      expect(@cur_weather.hi).to eq "HI"
    end

  end

end
