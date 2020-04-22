require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'


class IngredientTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new("Macaroni", "oz", 200)
  end

  def test_it_exists
    assert_instance_of Ingredient, @ingredient1
  end
end
# => #<Ingredient:0x007fe6041273d8...>
# 
# pry(main)> ingredient1.name
# # => "Cheese"
#
# pry(main)> ingredient1.unit
# # => "oz"
#
# pry(main)> ingredient1.calories
# # => 50
#
# # => #<Ingredient:0x007fd88582ed98...>
