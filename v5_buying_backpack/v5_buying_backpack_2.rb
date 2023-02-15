require 'webdrivers'
require 'watir'

require_relative 'shopping_helper'
include ShoppingHelper

@browser = Watir::Browser.new :chrome # Open chrome browser

login
add_backpack_to_cart
navigate_to_chechout_information_page
provide_checkout_information_and_navigate_to_checkout_overview_page
complete_checkout_successfully
sleep 1