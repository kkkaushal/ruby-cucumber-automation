Feature: Buy backpack online
    As a customer I want to by backpack
    So that I can use it for traveling

Scenario: Place order for backpack successfully
    Given I am logged in saucedemo shopping website
    When I provide my shipping info
    Then I should be eble to place an order for backpack successfully
