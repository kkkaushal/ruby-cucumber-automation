>>> info_v12.txt ***  

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
    
*>>> info_v11.txt:
  Managing env config using 'fig_newton' by updating both (all) "FIG_NEWTON_FILE=saucedemo1.yml" and "FIG_NEWTON_FILE=saucedemo2.yml" in cucumber.yml
  and running with command "% bundle exec cucumber -p  demo1env/demo2env/default features/shopping.feature"

  1. Update profile in cucumber.yml:
    default:  FIG_NEWTON_FILE=saucedemo1.yml --no-source --color --format pretty --publish-quiet
    demo1env: FIG_NEWTON_FILE=saucedemo1.yml --no-source --color --format pretty --publish-quiet
    demo2env: FIG_NEWTON_FILE=saucedemo2.yml --no-source --color --format pretty --publish-quiet

  2. Run it like this -
  bundle exec cucumber -p demo2env features/shopping.feature

  >>> info_v10.txt:
  DataMagic.yml_directory = 'config/data' # (default is also 'config/data') To inform the gem where it can find the yaml data files.
  DataMagic.load('checkout_info.yml') #  To inform the gem to use another file than 'default.yml'.
  DataMagic.load_for_scenario(scenario) # In 'hooks.rb' file 'Before' block.

  *******************
  *** shopping_v10 ***
  *******************
  * Implemented 'Examples:' scenarios.
  * Implemented passing hash parameter that override the default data hash parameter.

  *******************
  *** shopping_v9.1 ***
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

>>> info_v9.txt: 
  Extend Cucumber.
  * include PageFactory - add this in the class in the *page.rb file(s).
  * Use visit() and on() methods.
  * 'page_ur <url>' declaration helps automatically create .goto(url) method when object is created.

>>> info_v8: 
  Implement PageObject:
  * gem 'page-object' - add this in Gemfile
  * require 'page-object' - add this in env.rb
  * include PageObject - add this in the class in the *page.rb file(s).

  * With PageObject implemented two things to note here for time being-
  a. No need to initialize class, PageObject does it for us.
  b. Metaprogramming - we need to just declare elements and upon calling the PageObject creates methods for us.

>>> info_v7.txt: 
Class-Object implementation
. Put all the definitions in 'module' into a class and add an initialize method.
  def initialize(browser)
     @browser = browser
  end
. 'require "Users/<>/v6_buying_backpack/support/pages/shopping_helper_page"' or 'require_relative shopping_helper_page' is not needed as when Cucumber starts,
 it creates a class name 'World', loads all the files in directories under 'features' directory.
. "shopping_helper_page.rb" is usually put in pages directory but it can also be put in 'features' directory or in any any directories under 'feature'

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