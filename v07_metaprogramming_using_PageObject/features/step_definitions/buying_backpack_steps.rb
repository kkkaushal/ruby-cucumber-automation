
Given('I am logged in saucedemo shopping website') do
  @helper = ShoppingHelper.new(@browser)
  @helper.goto_login_page
  @helper.login
end

When('I provide my shipping info') do
  @helper.add_backpack_to_cart
  @helper.navigate_to_chechout_information_page
  @helper.provide_checkout_information_and_navigate_to_checkout_overview_page
end

Then('I should be eble to place an order for backpack successfully') do
  @helper.complete_checkout_successfully
end