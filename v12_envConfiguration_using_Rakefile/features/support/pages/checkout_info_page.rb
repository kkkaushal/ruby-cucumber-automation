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
        self.continuebutton
        sleep 1
    end

    def error_message
        self.errorarea
    end

end
