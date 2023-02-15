# require "/Users/<name>/v6_buying_backpack/features/support/pages/shopping_helper_page.rb" # when ShoppingHelper module file in in 'features/support/pages/shopping_helper_page.rb'
require_relative 'shopping_helper_page'

include ShoppingHelper

Given('I am logged in saucedemo shopping website') do
  login
end

When('I provide my shipping info') do
  add_backpack_to_cart
  navigate_to_chechout_information_page
  provide_checkout_information_and_navigate_to_checkout_overview_page
end

Then('I should be eble to place an order for backpack successfully') do
  complete_checkout_successfully
end