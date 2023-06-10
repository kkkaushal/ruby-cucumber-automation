>>> info_v10:
    DataMagic.yml_directory = 'config/data' # (default is also 'config/data') To inform the gem where it can find the yaml data files.
    DataMagic.load('checkout_info.yml') #  To inform the gem to use another file than 'default.yml'.
    DataMagic.load_for_scenario(scenario) # In 'hooks.rb' file 'Before' block.

    *******************
    *** shopping_v2 ***
    *******************
    * Implemented 'Examples:' scenarios.
    * Implemented passing hash parameter that override the default data hash parameter.

    *******************
    *** shopping_v1 ***
    *******************
    * Simple scenario to be evolve into an 'Examples:' scenario and 
    * Also passing hash parameter that override the default data hash.
    Purpose is to test error messages when a set of test feilds is left empty.

    * Evolution of DataMagic
    * Explanation of 'def checkout_with(data = {})'
    * Explanation of 'data_for(:checkout_info, data)'
    * Explanation 'data = DEFAULT_DATA.merge(data)'


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

    # *
    The modified parameter passed to our checkout method - data = {} is Ruby’s way of specifying a default parameter to the method. 
    If we provide a parameter when we call this method then it is passed on through. If we call the method without passing a parameter the default will be used 
    which in this case is an empty Hash. The effect of using the empty Hash is to just use all of the default data.

    # **
    It merges the data passed to the method with the default data of the page. 
    The merge simply tries to match up a key and if a match is found it will update the corresponding value.***

    # **
    hash1 = {
        "one" => 1,
        "two" => 2,
        "three" => 3
    }

    hash2 = hash1.merge('one' => 1.0)
    puts hash2

>>> info_v9: 
    Extend Cucumber.
    * include PageFactory - add this in class in *page.rb file.
    * Use visit() and on() methods.
    * 'page_ur <url>' declaration helps automatically create .goto(url) method when object is created.
 
 >>> info_v8: 
    Implement PageObject:
    * gem 'page-object' - add this in Gemfile
    * require 'page-object' - add this in env.rb
    * include PageObject - add this in class in *page.rb file
 
    * With PageObject implemented two things to note here for time being-
      a. No need to initialize class, PageObject does it for us.
      b. Metaprogramming - we need to just declare elements and upon calling the PageObject creates methods for us.
    
 >>> info_v7: 
    Class-Object implementation
    Put all the definitions in 'module' into a class and add an initialize method.
    
    
 >>> info_v6:
    Now we are going to do some major change to our scripts.
 
    * We will use gem 'testgen' to genrate cucumber project directory structure
       % gem install 'testgen'
       % testgen project "v6_buying_backpack"
          create  v6_buying_backpack
          create  v6_buying_backpack/cucumber.yml
          create  v6_buying_backpack/Gemfile
          create  v6_buying_backpack/Rakefile
          create  v6_buying_backpack/features
          create  v6_buying_backpack/features/support
          create  v6_buying_backpack/features/step_definitions
          create  v6_buying_backpack/features/support/env.rb
          create  v6_buying_backpack/features/support/hooks.rb
          create  v6_buying_backpack/features/support/pages
 
       % cd v6_buying_backpack
 
    * Create a 'buying_backpack.feature' file in project folder and update Ghenkin scenario in and run below command-
       % cucumber features/buying_backpack.feature # It will generate scenario implementation snippets.
       
    * Create step definition file 'buying_backpack_steps.rb' in 'v6_buying_backpack/features/step_definitions' folder
    And update the cenario implementation snippets in it.
 
    * Put shopping_helper_page.rb in 'v6_buying_backpack/features/step_definitions' folder as well.
    You can put it in 'pages' folder as well but then you need to provide complete path and use 'required' indtead of 'require_relative' as below-
    require "Users/<>/v6_buying_backpack/support/pages/shopping_helper_page"
 
    * Now update the buying_backpack_steps.rb and run the test script.
 
 
 
 
 