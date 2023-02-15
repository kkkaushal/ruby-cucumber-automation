require 'webdrivers'
require 'watir'

require_relative 'shopping_helper'
include ShoppingHelper

@browser = Watir::Browser.new :chrome # Open chrome browser

login # Login to saucedemo.com
add_backpack_to_cart # Add backpack to cart:
navigate_to_chechout_information_page # Navigate to chechout information page
provide_checkout_information_and_navigate_to_checkout_overview_page # Provide checkout information and navigate to checkout overview page
complete_checkout_successfully # Complete checkout successfully:
sleep 1
