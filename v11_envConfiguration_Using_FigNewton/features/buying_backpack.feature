Feature: Mandatory fields on checkout information page
    As a shopper I want to be allowed
    When I provide valid data
    So that my order can be processed without any issue

Scenario: Verify mandatory fields on checkout info page
    Given I am on checkout information page
    When I checkout with a missing field "<text_field>"
    Then I should see "<error_message>"

Examples:
  | text_field  |  error_message                 |
  | firstname   | Error: First Name is required  |
#  | lastname    | Error: Last Name is required   |
#  | postalcode  | Error: Postal Code is required |
