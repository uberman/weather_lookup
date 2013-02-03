require 'open-uri'
require 'json'

Given /^a call to the weather API with (.*)$/ do |city|
  @wquery = JSON.parse(open("http://api.wunderground.com/api/79eeb28dcd70662e/conditions/q/CA/#{city}.json").read)
end

Then /^the response should give a (.*)$/ do |weather_forecast|
  @wquery['current_observation']['weather'].should == "#{weather_forecast}"
end

Then /^the zip (.*)$/ do |zipcode|
  @wquery['current_observation']['display_location']['zip'].to_s.should == "#{zipcode}"
end

# The regex's were the trickiest part of this... otherwise really straightforward
# API regex's were helped with these two pages:
#  http://www.wunderground.com/weather/api/d/docs#current_conditions_in_us_city
# and
#  http://jsonprettyprint.com/json-pretty-printer.php