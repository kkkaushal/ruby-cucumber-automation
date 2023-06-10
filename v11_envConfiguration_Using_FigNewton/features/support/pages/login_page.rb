class LoginPage

    include PageObject
    include DataMagic

    
    page_url  FigNewton.base_url # Fig_Newton implementation

    text_field(:username, id: 'user-name')
    text_field(:password, id: 'password')
    button(:loginbutton, id: 'login-button' )

    def login_to_system(username = FigNewton.admin.username, password = FigNewton.admin.password)
        self.username = username
        self.password = password
        sleep 2
        self.loginbutton
    end

end