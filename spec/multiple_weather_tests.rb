RSpec.shared_examples "multiple weather tests" do

  it "should have a list array of all locations" do
    expect(@cur_weather.get_value_of "list").to be_a Array
  end

  context "each entry" do

    it "should have an id integer" do
      expect(@cur_weather.get_each_value_of "id").to all be_a Integer
    end

    it "should have a name string" do
      expect(@cur_weather.get_each_value_of "name").to all be_a String
    end

    it "should have lat & lon numbers in the coords hash" do
      expect(@cur_weather.get_each_value_of "coord").to all be_a Hash
      expect(@cur_weather.get_each_coord_property "lat").to all be_a Numeric
      expect(@cur_weather.get_each_coord_property "lon").to all be_a Numeric
    end

    it "should have with temp, pressure, humidity, temp_min and temp_max numbers in a main hash" do
      expect(@cur_weather.get_each_value_of "main").to all be_a Hash
      expect(@cur_weather.get_each_main_property "temp").to all be_a Numeric
      expect(@cur_weather.get_each_main_property "pressure").to all be_a Numeric
      expect(@cur_weather.get_each_main_property "humidity").to all be_a Numeric
      expect(@cur_weather.get_each_main_property "temp_min").to all be_a Numeric
      expect(@cur_weather.get_each_main_property "temp_max").to all be_a Numeric
    end

    it "should have a dt integer" do
      expect(@cur_weather.get_each_value_of "dt").to all be_a Integer
    end

    it "should have speed and degrees numbers in a wind hash" do
      expect(@cur_weather.get_each_value_of "wind").to all be_a Hash
      expect(@cur_weather.get_each_wind_property "speed").to all be_a Numeric
      expect(@cur_weather.get_each_wind_property "deg").to all be_a Numeric
    end

    it "should have a sys hash" do
      expect(@cur_weather.get_each_value_of "sys").to all be_a Hash
    end

    it "should have a rain hash or nil value" do
      expect(@cur_weather.get_each_value_of "rain").to all be_a(Hash).or eq nil
    end

    it "should have a snow hash or nil value" do
      expect(@cur_weather.get_each_value_of "rain").to all be_a(Hash).or eq nil
    end

    it "should have a clouds hash or nil value" do
      expect(@cur_weather.get_each_value_of "rain").to all be_a(Hash).or eq nil
    end

    it "should have a weather hash with id, main, description and icon values" do
      expect(@cur_weather.get_each_value_of("weather").first).to all be_a Hash
      expect(@cur_weather.get_each_weather_property "id").to all be_a Integer
      expect(@cur_weather.get_each_weather_property "main").to all be_a String
      expect(@cur_weather.get_each_weather_property "description").to all be_a String
      expect(@cur_weather.get_each_weather_property "icon").to all be_a String
    end

  end


end
