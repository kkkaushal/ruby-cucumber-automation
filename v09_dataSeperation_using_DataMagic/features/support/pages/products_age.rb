class ProductPage
    
    include PageObject
    include DataMagic

    button(:backpackbutton, id: 'add-to-cart-sauce-labs-backpack')
    link(:cartlink, class: 'shopping_cart_link')

    def add_backpack_to_cart
        self.backpackbutton
    end

    def goto_cart_page
        puts self.cartlink
    end

end