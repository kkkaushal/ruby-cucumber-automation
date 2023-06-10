require 'webdrivers'
require 'watir'

# Open chrome browser
@browser = Watir::Browser.new :chrome

# define method for logging in to saucedemo.com
def method1()
    @browser.goto "https://saucedemo.com"
    @browser.text_field(id: 'user-name').set('standard_user')
    @browser.text_field(id: 'password').set('secret_sauce')
    @browser.button(id: 'login-button').click
end

def method2()
    @browser.button(id: 'add-to-cart-sauce-labs-backpack').click
end

def method3()
    @browser.a(class: 'shopping_cart_link').click
    @browser.button(id: 'checkout').click
end

def method4()
    @browser.text_field(id: 'first-name').set('turiyam')
    @browser.text_field(id: 'last-name').set('krishna')
    @browser.text_field(id: 'postal-code').set('78759')
    @browser.button(id: 'continue').click
end

def method5()
    @browser.button(id: 'finish').click
    puts "Is the cbackpack order placed?: #{@browser.div(id: 'checkout_complete_container').h2(class: "complete-header").text == 'Thank you for your order!'}" 
end


method1 # Login to saucedemo.com
method2 # Add backpack to cart:
method3 # Navigate to chechout information page
method4 # Provide checkout information and navigate to checkout overview page
sleep 1
method5 # Complete checkout successfully:
sleep 1

# Lets say, you want to buy another backpack. For that you repeat same steps:
method1
method2
method3
method4
sleep 1
method5
sleep 1

=begin
Note:
1. In last version (v2_buying_backpack.rb), we had to pass browser to every method - that feels wierd.
   So solve that issue we can use concept of Instance variable i.e. make 'browser' as '@browser' so 
   that it can be accessed even inside a method without passing it as an argument.
=end