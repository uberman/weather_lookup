Feature: Verify the weather API returns JSON

  Scenario Outline: Test that the API works for weather
    Given a call to the weather API with <city>
    Then the response should give a <weather_forecast>
    Then the zip <zipcode>


  Examples:
    |city|weather_forecast|zipcode|
    |Fresno|Haze|93650|
    |San_Francisco|Mostly Cloudy|94101|


