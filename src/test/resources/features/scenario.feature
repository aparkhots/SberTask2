Feature: Testing Weather api

  Scenario Outline: Cases for 4 cities
    Given Start link is "api.weatherapi.com/v1"
    And Add API method "/current.json"
    And Set parameter "key" as "a2037d6e85a14ca1bb8170221240706"
    And Set parameter "q" as <city>
    When I send request
    Then I expect status code 200
    And I expect ContentType of response as "application/json"
    And I expect value of "location.country" is <country> in response
    And I expect value of "location.tz_id" is <TimeZone> in response

    Examples:
      | city     | country   | TimeZone        |
      | "Brest"  | "Belarus" | "Europe/Minsk"  |
      | "Minsk"  | "Belarus" | "Europe/Minsk"  |
      | "Warsaw" | "Poland"  | "Europe/Warsaw" |
      | "Moscow" | "Russia"  | "Europe/Moscow" |

  Scenario: Request without city
    Given Start link is "api.weatherapi.com/v1"
    And Add API method "/current.json"
    And Set parameter "key" as "a2037d6e85a14ca1bb8170221240706"
    When I send request
    Then I expect status code 400

  Scenario: Request without API Key
    Given Start link is "api.weatherapi.com/v1"
    And Add API method "/current.json"
    And Set parameter "q" as "Brest"
    When I send request
    Then I expect status code 401

  Scenario: Request with incorrect API Key
    Given Start link is "api.weatherapi.com/v1"
    And Add API method "/current.json"
    And Set parameter "key" as "a2037d6e85a14ca1bb81702212407"
    And Set parameter "q" as "Brest"
    When I send request
    Then I expect status code 403

  Scenario: Request with incorrect start link
    Given Start link is "api.weatherapi.com"
    And Add API method "/current.json"
    And Set parameter "key" as "a2037d6e85a14ca1bb8170221240706"
    And Set parameter "q" as "Brest"
    When I send request
    Then I expect status code 404
