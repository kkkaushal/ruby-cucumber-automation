Given('I am on checkout information page') do
    visit(LoginPage)
    sleep 1
end

When('I checkout with a missing field {string}') do |empty_field|
    navigate_to(CheckoutInfoPage).checkout_with({empty_field => ''})
end

Then('I should see {string}') do |error_msg|
    expect(on(CheckoutInfoPage).error_message).to eq(error_msg)
end
