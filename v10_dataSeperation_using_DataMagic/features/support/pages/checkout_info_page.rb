class CheckoutInfoPage

    include PageObject
    include DataMagic

    text_field(:firstname, id: 'first-name')
    text_field(:lastname,  id: 'last-name')
    text_field(:postalcode, id: 'postal-code')
    button(:continuebutton, id: 'continue')

    h3(:errorarea, data_test: 'error')

    # # Iteration 3:
    def checkout_with(data = {})
        populate_page_with data_for(:checkout_info, data)
        sleep 1
        continuebutton
        sleep 1
    end

    # # # Iteration 2:
    # def checkout_with(data = {})
    #     data = data_for(:checkout_info).merge(data)
    #     populate_page_with data
    #     sleep 1
    #     continuebutton
    #     sleep 1
    # end

    # # Iteration 1:
    # DEFAULT_DATA = {
    #     'firstname' => 'Ryan',
    #     'lastname' => 'Ford',
    #     'postalcode' => '78759'
    # }
    #
    # def checkout_with(data = {})        # *
    #     data = DEFAULT_DATA.merge(data)     # **
    #     populate_page_with data
    #     sleep 1
    #     continuebutton
    #     sleep 1
    # end


    def error_messages
        errorarea
    end

end

# # *
# The modified parameter passed to our checkout method - data = {} is Ruby’s way of specifying a default parameter to the method. 
# If we provide a parameter when we call this method then it is passed on through. If we call the method without passing a parameter the default will be used 
# which in this case is an empty Hash. The effect of using the empty Hash is to just use all of the default data.

# # **
# It merges the data passed to the method with the default data of the page. 
# The merge simply tries to match up a key and if a match is found it will update the corresponding value.***

# # **
# hash1 = {
#     "one" => 1,
#     "two" => 2,
#     "three" => 3
# }

# hash2 = hash1.merge('one' => 1.0)
# puts hash2