require 'minitest/autorun'
require 'minitest/pride'
require './lib/pantry'
require './lib/ingredient'

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new

    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})

  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_it_has_attributes
    assert_equal ({}), @pantry.stock
  end

  def test_stock_check
    assert_equal 0, @pantry.stock_check(@ingredient1)
  end

  def test_restock_ingredient
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    assert_equal 15, @pantry.stock_check(@ingredient1)

  end
end
# ```markdown
# There are **4** Possible Points in Iteration 1:
# 1. Ingredient Creation - including all attr_readers
# 2. Pantry Creation - including all attr_readers
# 3. Pantry #check_stock
# 4. Pantry #restock
# ```


# pry(main)> pantry.restock(ingredient2, 7)
#
# pry(main)> pantry.stock_check(ingredient2)
# # => 7
# ```
