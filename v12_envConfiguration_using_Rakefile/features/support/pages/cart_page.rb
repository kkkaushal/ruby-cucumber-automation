class CartPage
    
    include PageObject
    include DataMagic

    button(:checkout, id: 'checkout')

    def goto_checkout_info_page
        self.checkout
    end

end