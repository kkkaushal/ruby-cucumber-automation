1. In last version (v4_buying_backpack.rb), methods names were more in terms of DSL. 
   Now say we want those methods to be used by other script as well, what's needed for that?
   That can be achieved by implementing concept of 'module'.

2. Lets now split our script in two different files "v5_buying_backpack_1.rb" and "v5_buying_backpack_2.rb"
   And keep the methods in a 3rd file named "shopping_helper.rb" under a module named "ShoppingHelper".

3. To use methods put in "shopping_helper.rb" in "v5_buying_backpack_1.rb" and "v5_buying_backpack_2.rb" scripts,
   we need to do two things-
   i. require_relative 'shopping_helper' and 
   ii. include ShoppingHelper

=end