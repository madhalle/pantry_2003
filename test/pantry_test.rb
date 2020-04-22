require 'minitest/autorun'
require 'minitest/pride'
require './lib/pantry'
require './lib/ingredient'

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_it_has_attributes
    assert_equal ({}), @pantry.stock
  end
end
# ```markdown
# There are **4** Possible Points in Iteration 1:
# 1. Ingredient Creation - including all attr_readers
# 2. Pantry Creation - including all attr_readers
# 3. Pantry #check_stock
# 4. Pantry #restock
# ```
# # => #<Pantry:0x007fd8858863b8...>
#

#
# pry(main)> pantry.stock_check(ingredient1)
# # => 0
#
# pry(main)> pantry.restock(ingredient1, 5)
#
# pry(main)> pantry.restock(ingredient1, 10)
#
# pry(main)> pantry.stock_check(ingredient1)
# # => 15
#
# pry(main)> pantry.restock(ingredient2, 7)
#
# pry(main)> pantry.stock_check(ingredient2)
# # => 7
# ```
