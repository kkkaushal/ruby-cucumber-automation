class CheckoutComplete

    include PageObject

    h2(:messagearea, class: 'complete-header')

    def message
        messagearea
    end

end