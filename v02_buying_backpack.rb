require 'webdrivers'
require 'watir'

# Open chrome browser
browser = Watir::Browser.new :chrome

# define method for logging in to saucedemo.com
def method1(browser)
    browser.goto "https://saucedemo.com"
    browser.text_field(id: 'user-name').set('standard_user')
    browser.text_field(id: 'password').set('secret_sauce')
    browser.button(id: 'login-button').click
end

def method2(browser)
    browser.button(id: 'add-to-cart-sauce-labs-backpack').click
end

def method3(browser)
    browser.a(class: 'shopping_cart_link').click
    browser.button(id: 'checkout').click
end

def method4(browser)
    browser.text_field(id: 'first-name').set('turiyam')
    browser.text_field(id: 'last-name').set('krishna')
    browser.text_field(id: 'postal-code').set('78759')
    browser.button(id: 'continue').click
end

def method5(browser)
    browser.button(id: 'finish').click
    puts "Is the cbackpack order placed?: #{browser.div(id: 'checkout_complete_container').child.text == 'THANK YOU FOR YOUR ORDER'}"   
end


method1(browser) # Login to saucedemo.com
method2(browser) # Add backpack to cart:
method3(browser) # Navigate to chechout information page
method4(browser) # Provide checkout information and navigate to checkout overview page
sleep 1
method5(browser) # Complete checkout successfully:
sleep 1

# Lets say, you want to buy another backpack. For that you repeat same steps:
method1(browser)
method2(browser)
method3(browser)
method4(browser)
sleep 1
method5(browser)
sleep 1

=begin
Note:
1. We saw in last version (v1_buying_backpack.rb), we had to write same lines ofcode again to buy another backpack.
   Here by creating methods we have made the code a bit of DRY (Don't Repeat Yourself.)
=end