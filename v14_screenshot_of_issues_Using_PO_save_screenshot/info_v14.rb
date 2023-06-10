info_v14.txt:
  Saving screenshot of issue using PageObject save_screenshot(file_name)

    * To get screenshot of issue, update your After hook to the following:

      After do |scenario|
        if scenario.failed?
          time = Time.now.strftime("%Y-%m-%d_%H-%M-%S")
          filename = "error-#{@current_page.class}-#{time}.png"
          filepath = File.join('testresults','error_image', filename.to_s) 
          @current_page.save_screenshot(filepath)
        end
        @browser.close
      end

    # Notice that @current_page is being used to get hold of a page object. On line 4 we are saving the image.

*******************
*** shopping_v9 *** Reporting the results - Cucumber Html format:
*******************

* Cucumber has a built-in html report that is easy to configure. You can generate this report by 
  i. passing '--format html --out testresults/report.html' as command line parameters to cucumber and 
  ii. creating 'report.html' file under /<project_name>/testresults to store the result./
  
* pretty_face: gem doesn not work.

*******************
*** shopping_v8 ***
*******************

* Rake also supports the "notion" of namespaces. In rake a namespace is simply a way to group similar tasks. 
  Here is an example taken from the Rakefile for the page-object gem:

  Rakefile:
  require 'rubygems'
  require 'cucumber'
  require 'cucumber/rake/task'
  
  Cucumber::Rake::Task.new(:features) do |t|
    t.profile = 'default'
  end
  
  task :default => :features
    namespace :features do
      Cucumber::Rake::Task.new(:watir_webdriver, "Run features with Watir") do |t|
        t.profile = "watir"
      end
      
      Cucumber::Rake::Task.new(:selenium_webdriver, "Run features with Selenium") do|t|
        t.profile = "selenium"
      end
      
      desc 'Run all features using watir and selenium'
      task :all => [:watir_webdriver, :selenium_webdriver]
    end

  % rake features will run scenarios based on settings in 'default' profile in cucumber.yml.
  % rake features:watir_webdriver will run scenarios based on settings in 'watir' profile in cucumber.yml.
  % rake features:selenium_webdriver will run scenarios based on settings in 'selenium' profile in cucumber.yml.
  % rake features:all will run scenarios based on settings in 'watir' profile and 'selenium' profile in cucumber.yml.  
  
  cucumber.yml:
  default:  FIG_NEWTON_FILE=saucedemo1.yml --no-source --color --format pretty --publish-quiet
  watir:    FIG_NEWTON_FILE=saucedemo1.yml --no-source --color --format pretty --publish-quiet --tags @watir
  selenium: FIG_NEWTON_FILE=saucedemo2.yml --no-source --color --format pretty --publish-quiet --tags @selenium

*******************
*** shopping_v7 ***  Running test script using Rakefile.
*******************

* Creating a script to run our tests (Rakefiles):
  require 'rubygems'
  require 'cucumber'
  require 'cucumber/rake/task'

  Cucumber::Rake::Task.new(:features) do |t| # *^1
    t.profile = 'default'
  end

  task :default => :features

  *^1 : A new task named 'features' is created that uses the default profile.
  
*******************
*** shopping_v6 ***  Managing env config using 'fig_newton' by updating both (all) "FIG_NEWTON_FILE=saucedemo1.yml" and "FIG_NEWTON_FILE=saucedemo2.yml" in cucumber.yml
*******************  and running with command "% bundle exec cucumber -p  demo1env/demo2env/default features/shopping.feature"
    
    1. Update profile in cucumber.yml:
        default:  FIG_NEWTON_FILE=saucedemo1.yml --no-source --color --format pretty --publish-quiet
        demo1env: FIG_NEWTON_FILE=saucedemo1.yml --no-source --color --format pretty --publish-quiet
        demo2env: FIG_NEWTON_FILE=saucedemo2.yml --no-source --color --format pretty --publish-quiet
    
    2. Run it like this -
       bundle exec cucumber -p demo2env features/shopping.feature
    
*******************
*** shopping_v5 *** Managing environment config using 'fig_newton' by updating "FIG_NEWTON_FILE=saucedemo1.yml" or "FIG_NEWTON_FILE=saucedemo2.yml" in cucumber.yml
*******************
    
    1. Remove FigNewton.load from env.rb file.
    
    2. Update below in cucumber.yml
       FIG_NEWTON_FILE=saucedemo1.yml and run shopping.feature and it should be fine.
    
    3. Change it to FIG_NEWTON_FILE=saucedemo2.yml and run again.
    
    Problem: Again here we have to change the FIG_NEWTON_FILE value in cucumber.yml
    Solution: create another profile in cucumber.yml and pass the profile while running test from command prompt.
    
*******************
*** shopping_v4 ***  Managing environment config using 'fig_newton' by updating "FigNewton.load('saucedemo1.yml')" or "FigNewton.load('saucedemo1.yml')" in env.rb file.
*******************
    
    1. Make gem available to project - gem 'fig_newton' in Gemfile & bundle install.
    
    2. env.rb
      
       require 'fig_newton'
    
       FigNewton.load('saucedemo1.yml')
    
    3. By default fig_newton will look for files in the config/environments 
       directory. Let’s create a simple file named 'saucedemo1.yml' in that directory
       and place the following contents into it.
    
        base_url: https://saucedemo.com
        admin:
          username: standard_user
          password: secret_sauce
    
    4. Update LoginPage class.
        def login_to_system(username = FigNewton.admin.username, password = FigNewton.admin.password)
          self.username = username
          self.password = password
          login
        end
    
        Run shopping.feature and it should be fine.
    
    5. Repeat 3 ('config/environments/saucedemo2.yml') for different environment- 
        different url and data but same application behavior.
        To run the test in new env, simply update the yml file loading.
    
        FigNewton.load('saucedemo2.yml')
    
        Run shopping.feature and it should be fine.
    
      Issue: We have to change yml data environment file to change the AUT env.
      Solution: fig_newton - when fig_newton does not find FigNewton.load in env.rb file, it will look for the value of an environment variable named
      FIG_-NEWTON_FILE.  If it did not find the environment variable it will look for a file that is named after the host name of the computer. e.g. if the
      hostname is systemtest, FigNewton will look for a file named systemtest.yml.
      Finally, it will use the filename default.yml if you do not call load and the environment variable is not set.
    
      We can use the environment variable to our advantage to help us choose which file to use without making any changes to the env.rb file. 
    
      See shopping_v4

*******************
*** shopping_v3 ***
*******************
* Implemented PageFactory.routes
* Tested below statement by printing '@current_page.error_message' and it prints exactly same as 'on(CheckoutInfoPage).error_message' does.
  'PageFactory' sets an instance variable @current_page each time you use a new page.


Issue: Post implementation, the script was not navigating to the url.
Solution: 'visit(LoginPage)' part was commented as it did not have any method associated. It needs to be there for navigation to the url.

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