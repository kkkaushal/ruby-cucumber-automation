
class ShoppingHelper

    def initialize(browser)
        @browser = browser
    end

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
        puts "Is the cbackpack order placed (true/false)? : #{@browser.div(id: 'checkout_complete_container').h2(class: "complete-header").text == 'Thank you for your order!'}"  
    end

end