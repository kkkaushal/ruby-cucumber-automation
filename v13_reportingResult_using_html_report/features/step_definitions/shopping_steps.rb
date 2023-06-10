Given('I am on checkout information page') do
    visit(LoginPage)
end

When('I checkout with all the correct details') do
    navigate_to(CheckoutOverveiw).complete_order
end

When('I checkout with a missing field {string}') do |empty_field|
    navigate_to(CheckoutInfoPage).checkout_with({empty_field => ''})
end
  
Then('I should be able to complete the order successfully with {string} message') do |msg|
    expect(on(CheckoutComplete).message).to eq(msg)
end

Then('I should see {string}') do |error_msg|
    expect(on(CheckoutInfoPage).error_message).to eq(error_msg)
end

