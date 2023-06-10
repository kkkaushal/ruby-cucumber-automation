
Given('I am logged in saucedemo shopping website') do
  # @helper = ShoppingHelper.new(@browser)
  visit(ShoppingHelper).login
end

When('I provide my shipping info') do
  on(ShoppingHelper).add_backpack_to_cart
  on(ShoppingHelper).navigate_to_chechout_information_page
  on(ShoppingHelper).provide_checkout_information_and_navigate_to_checkout_overview_page
end

Then('I should be eble to place an order for backpack successfully') do
  on(ShoppingHelper).complete_checkout_successfully
end