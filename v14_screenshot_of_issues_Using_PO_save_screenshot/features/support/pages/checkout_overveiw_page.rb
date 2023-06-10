class CheckoutOverveiw

    include PageObject

    button(:finishbutton, id: 'finish')

    def complete_order
        self.finishbutton
    end

end