require 'webdrivers'
require 'watir'

# Open chrome browser
@browser = Watir::Browser.new :chrome

# define method for logging in to saucedemo.com
def login()
    @browser.goto "https://saucedemo.com"
    @browser.text_field(id: 'user-name').set('standard_user')
    @browser.text_field(id: 'password').set('secret_sauce')
    @browser.button(id: 'login-button').click
end

def add_backpack_to_cart()
    @browser.button(id: 'add-to-cart-sauce-labs-backpack').click
end

def navigate_to_chechout_information_page()
    @browser.a(class: 'shopping_cart_link').click
    @browser.button(id: 'checkout').click
end

def provide_checkout_information_and_navigate_to_checkout_overview_page()
    @browser.text_field(id: 'first-name').set('turiyam')
    @browser.text_field(id: 'last-name').set('krishna')
    @browser.text_field(id: 'postal-code').set('78759')
    @browser.button(id: 'continue').click
end

def complete_checkout_successfully()
    @browser.button(id: 'finish').click
    puts "Is the cbackpack order placed?: #{@browser.div(id: 'checkout_complete_container').child.text == 'THANK YOU FOR YOUR ORDER'}"   
end


login # Login to saucedemo.com
add_backpack_to_cart # Add backpack to cart:
navigate_to_chechout_information_page # Navigate to chechout information page
provide_checkout_information_and_navigate_to_checkout_overview_page # Provide checkout information and navigate to checkout overview page
complete_checkout_successfully # Complete checkout successfully:
sleep 1

# Lets say, you want to buy another backpack. For that you repeat same steps:
login
add_backpack_to_cart
navigate_to_chechout_information_page
provide_checkout_information_and_navigate_to_checkout_overview_page
complete_checkout_successfully
sleep 1

=begin
Note:
1. In last version (v3_buying_backpack.rb), we saw methods named as 'method1', 'method2'... It is simple and makes code dry.
   But to know what a method does, we need to go and check its implementation. To fix that we can simply create DSL (Domain 
   Specific Language). e.g. 'add_backpack_to_cart' makes much sense and reads well than 'method2' 

=end