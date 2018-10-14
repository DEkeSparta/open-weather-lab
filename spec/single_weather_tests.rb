RSpec.shared_examples "single weather tests" do

  it "should get a city's weather information as a hash" do
    expect(@test_weather).to be_a Hash
  end

  it "should have coordinates with correct lon and lat numbers" do
    expect(@cur_weather.get_value_of "coord").to be_a Hash
    expect(@cur_weather.get_value_of("coord")["lon"]).to be_between -180, 180
    expect(@cur_weather.get_value_of("coord")["lat"]).to be_between -90, 90
  end

  it "should have a weather array with an integer id and strings main, description, and icon" do
    expect(@cur_weather.get_value_of "weather").to be_a Array
    expect(@cur_weather.get_weather_property "id").to be_a Integer
    expect(@cur_weather.get_weather_property "main").to be_a String
    expect(@cur_weather.get_weather_property "description").to be_a String
    expect(@cur_weather.get_weather_property "icon").to be_a String
  end

  it "should have a base string" do
    expect(@cur_weather.get_value_of "base").to be_a String
  end

  it "should have a main hash with temp, pressure, humidity, temp_min and temp_max numbers" do
    expect(@cur_weather.get_value_of "main").to be_a Hash
    expect(@cur_weather.get_main_property "temp").to be_a Numeric
    expect(@cur_weather.get_main_property "pressure").to be_a Numeric
    expect(@cur_weather.get_main_property "humidity").to be_a Numeric
    expect(@cur_weather.get_main_property "temp_min").to be_a Numeric
    expect(@cur_weather.get_main_property "temp_max").to be_a Numeric
  end

  it "should have a wind hash with speed and degrees numbers" do
    expect(@cur_weather.get_value_of "wind").to be_a Hash
    expect(@cur_weather.get_wind_property "speed").to be_a Numeric
    expect(@cur_weather.get_wind_property "deg").to be_a Numeric
  end

  it "should have a clouds hash with an 'all' integer" do
    expect(@cur_weather.get_value_of "clouds").to be_a Hash
    expect(@cur_weather.get_value_of("clouds")["all"]).to be_a Integer
  end

  it "should have a dt integer" do
    expect(@cur_weather.get_value_of "dt").to be_a Integer
  end

  it "should have a sys hash with message, sunrise and sunset numbers, and potentially a country string and type, id numbers" do
    expect(@cur_weather.get_value_of "sys").to be_a Hash
    expect(@cur_weather.get_sys_property "type").to be_a(Integer).or be nil
    expect(@cur_weather.get_sys_property "id").to be_a(Integer).or be nil
    expect(@cur_weather.get_sys_property "message").to be_a Numeric
    expect(@cur_weather.get_sys_property "sunrise").to be_a Integer
    expect(@cur_weather.get_sys_property "sunset").to be_a Integer
    expect(@cur_weather.get_sys_property "country").to be_a(String).or be nil
  end

  it "should have a name string" do
    expect(@cur_weather.get_value_of "id").to be_a Integer
  end

  it "should have a dt integer" do
    expect(@cur_weather.get_value_of "name").to be_a String
  end

  it "should have a successful request code of 200" do
    expect(@cur_weather.get_value_of "cod").to eq 200
  end

end
