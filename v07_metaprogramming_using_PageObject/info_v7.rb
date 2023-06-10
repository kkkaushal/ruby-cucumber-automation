>>> info_v7.txt: 
   Implement PageObject:
   * gem 'page-object' - add this in Gemfile
   * require 'page-object' - add this in env.rb
   * include PageObject - add this in the class in the *page.rb file(s).

   * With PageObject implemented two things to note here for time being-
     a. No need to initialize class, PageObject does it for us.
     b. Metaprogramming - we need to just declare elements and upon calling the PageObject creates methods for us.
   
>>> info_v6.1.txt: 
   Class-Object implementation
   . Put all the definitions in 'module' into a class and add an initialize method.
      def initialize(browser)
         @browser = browser
      end
   . 'require "Users/<>/v6_buying_backpack/support/pages/shopping_helper_page"' or 'require_relative shopping_helper_page' is not needed as when Cucumber starts,
     it creates a class name 'World', loads all the files in directories under 'features' directory.
   . "shopping_helper_page.rb" is usually put in pages directory but it can also be put in 'features' directory or in any any directories under 'feature'
   
   
>>> info_v6.txt:
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




