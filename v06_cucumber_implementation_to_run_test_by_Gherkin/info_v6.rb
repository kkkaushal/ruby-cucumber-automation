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




