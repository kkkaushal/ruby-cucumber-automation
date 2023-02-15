
class ShoppingHelper

    include PageObject

    text_field(:username, id: 'user-name')
    text_field(:userpassword, id: 'password')
    button(:loginbutton, id: 'login-button')

    def goto_login_page
        @browser.goto "https://saucedemo.com"
    end

    # define method for logging in to saucedemo.com
    def login
        self.username= 'standard_user'
        self.userpassword= 'secret_sauce'
        self.loginbutton
    end

    button(:add_backpack, id: 'add-to-cart-sauce-labs-backpack')

    def add_backpack_to_cart
        self.add_backpack
    end

    a(:shopping_cart, class: 'shopping_cart_link')
    button(:checkout, id: 'checkout')

    def navigate_to_chechout_information_page
        self.shopping_cart
        self.checkout
    end

    text_field(:firstName, id: 'first-name')
    text_field(:lastName, id: 'last-name')
    text_field(:postalCode, id: 'postal-code')
    button(:continue, id: 'continue')

    def provide_checkout_information_and_navigate_to_checkout_overview_page
        self.firstName= 'turiyam'
        self.lastName= 'krishna'
        self.postalCode= '78759'
        self.continue
    end

    button(:finish, id: 'finish')

    def complete_checkout_successfully
        self.finish
        fail unless @browser.div(id: 'checkout_complete_container').child.text == 'THANK YOU FOR YOUR ORDER'
    end

end