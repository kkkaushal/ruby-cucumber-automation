Given('I am on checkout information page') do
    visit(LoginPage)
    on(LoginPage).goto_product_page
    on(ProductPage).add_backpack_to_cart
    on(ProductPage).goto_cart_page 
    on(CartPage).goto_checkout_info_page 
    sleep 1
end

When('I checkout with a missing field {string}') do |empty_field|
    on(CheckoutInfoPage).checkout_with({empty_field => ''})
end

Then('I should see {string}') do |error_msg|
    expect(on(CheckoutInfoPage).error_messages).to eq(error_msg)
end