require 'webdrivers'
require 'watir'

# Open chrome browser
browser = Watir::Browser.new :chrome

# Navigate to saucedemo.com
browser.goto "https://saucedemo.com"

# Login to saucedemo.com
browser.text_field(id: 'user-name').set('standard_user')
browser.text_field(id: 'password').set('secret_sauce')
browser.button(id: 'login-button').click

# Add backpack to cart:
browser.button(id: 'add-to-cart-sauce-labs-backpack').click

# Navigate to cart page:
browser.a(class: 'shopping_cart_link').click

# Navigate to chechout information page
browser.button(id: 'checkout').click

# Provide checkout information and navigate to checkout overview page
browser.text_field(id: 'first-name').set('turiyam')
browser.text_field(id: 'last-name').set('krishna')
browser.text_field(id: 'postal-code').set('78759')
browser.button(id: 'continue').click
sleep 1

# Complete checkout:
browser.button(id: 'finish').click
puts "Is the cbackpack order placed?: #{browser.div(id: 'checkout_complete_container').child.text == 'THANK YOU FOR YOUR ORDER'}"
sleep 1

# Lets say, you want to buy another backpack. For that you repeat same steps:
# Navigate to saucedemo.com
browser.goto "https://saucedemo.com"

# Login to saucedemo.com
browser.text_field(id: 'user-name').set('standard_user')
browser.text_field(id: 'password').set('secret_sauce')
browser.button(id: 'login-button').click

# Add backpack to cart:
browser.button(id: 'add-to-cart-sauce-labs-backpack').click

# Navigate to cart page:
browser.a(class: 'shopping_cart_link').click

# Navigate to chechout information page
browser.button(id: 'checkout').click

# Provide checkout information and navigate to checkout overview page
browser.text_field(id: 'first-name').set('turiyam')
browser.text_field(id: 'last-name').set('krishna')
browser.text_field(id: 'postal-code').set('78759')
browser.button(id: 'continue').click
sleep 1

# Complete checkout:
browser.button(id: 'finish').click
puts "Is the cbackpack order placed?: #{browser.div(id: 'checkout_complete_container').child.text == 'THANK YOU FOR YOUR ORDER'}"
sleep 1