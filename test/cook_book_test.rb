require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'

class CookBookTest < Minitest::Test
  def setup
    @cookbook = CookBook.new

    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
  end

  def test_it_exists
    assert_instance_of CookBook, @cookbook
  end

  def test_it_has_attributes
    assert_equal [], @cookbook.recipes
  end

  def test_add_recipe
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)

    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    assert_equal [@recipe1, @recipe2],@cookbook.recipes
    assert_equal ["Cheese", "Macaroni", "Ground Beef", "Bun"], @cookbook.ingredients
  end
  #
  # pry(main)> cookbook.add_recipe(recipe1)
  #
  # pry(main)> cookbook.add_recipe(recipe2)
  #
  # pry(main)> cookbook.ingredients
  # # => ["Cheese", "Macaroni", "Ground Beef", "Bun"]
  #
  # pry(main)> cookbook.highest_calorie_meal
  # # => #<Recipe:0x00007faae692a110...>
  #
  # pry(main)> pantry.restock(ingredient1, 5)
  #
  # pry(main)> pantry.restock(ingredient1, 10)
  #
  # pry(main)> pantry.enough_ingredients_for?(recipe)
  # # => false
  #
  # pry(main)> pantry.restock(ingredient2, 7)
  #
  # pry(main)> pantry.enough_ingredients_for?(recipe)
  # # => false
  #
  # pry(main)> pantry.restock(ingredient2, 1)
  #
  # pry(main)> pantry.enough_ingredients_for?(recipe)
  # # => true
  # ```
end
