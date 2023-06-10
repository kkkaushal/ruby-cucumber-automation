require 'require_all'
require_rel 'pages'

PageObject::PageFactory.routes = {
    default: [[LoginPage, :login_to_system], 
              [ProductPage, :add_backpack_to_cart], 
              [ProductPage, :goto_cart_page],
              [CartPage, :goto_checkout_info_page],
              [CheckoutInfoPage, :checkout_with],
              [CheckoutInfoPage, :error_message]]
}