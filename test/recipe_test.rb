require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})

    @recipe1 = Recipe.new("Mac and Cheese")
  end

  def test_it_exists
    assert_instance_of Recipe, @recipe1
  end

  def test_it_has_attributes
    assert_equal "Mac and Cheese", @recipe1.name
    assert_equal ({}),@recipe1.ingredients_required

  end
  
  def test_add_ingredient
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    expected = {@ingredient1 => 6, @ingredient2 => 8}
    assert_equal expected, @recipe1.ingredients_required
  end
end
# ```markdown
# There are **4** possible points in Iteration 2:
# 1. Recipe and CookBook Creation - including all attr_readers
# 2. Recipe #add_ingredient
# 3. Recipe #ingredients
# 4. CookBook #add_recipe
# ```

# # For the `add_ingredient` method, the first argument is an
# Ingredient, and the second argument is the amount of the ingredient
# required for the Recipe.
# #
# # The `total_calories` method should sum the calories of each
#  ingredient. The calories for each ingredient can be calculated by
#  multiplying the `calories` attribute of the Ingredient by the amount
#   of the ingredient required for the recipe.
# #


#
# # => {#<Ingredient:0x00007fd7811553c8...> => 6, #<Ingredient:0x00007fd78110b0e8...> => 8}
#
# pry(main)> recipe1.ingredients
# # => [#<Ingredient:0x007fe8438c7a70...>, #<Ingredient:0x007fe843857f40...>]
#
# pry(main)> recipe2 = Recipe.new("Cheese Burger")
#
# pry(main)> cookbook = CookBook.new
# # => #<CookBook:0x00007faae6a42228 @recipes=[]>
#
# pry(main)> cookbook.add_recipe(recipe1)
#
# pry(main)> cookbook.add_recipe(recipe2)
#
# pry(main)> cookbook.recipes
# # => [#<Recipe:0x00007faae69c9698...>, #<Recipe:0x00007faae692a110...>]
# ```

##
