class LoginPage

    include PageObject
    include DataMagic

    page_url 'https://saucedemo.com'
    text_field(:username, id: 'user-name')
    text_field(:userpassword, id: 'password')
    button(:loginbutton, id: 'login-button' )

    def goto_product_page(data = {})
        populate_page_with data_for(:login, data)
        self.loginbutton
    end

end