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

    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})

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

  def test_highest_calorie_meal
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)

    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)

    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    assert_equal @recipe2, @cookbook.highest_calorie_meal
  end

  def test_cookbook_date_created
    assert_equal "04-22-2020", @cookbook.date
  end
  # ```markdown
  # There are **2** possible points in iteration 4
  # 1. CookBook #date
  # 2. CookBook #summary
  # ```
  #
  #
  # For the `summary`, ingredients are listed in order of calories.
   # This is the amount of calories that ingredient contributes to
   # the total calories of the recipe, not the amount of calories per
   # single unit of the ingredient.

  # # The 'date' method should return the date the cookbook is created as "mm-dd-yyyy"
  # # => "04-22-2020"
  #
  # pry(main)> ingredient1 = Ingredient.new(name: "Cheese", unit: "C", calories: 100)
  # # => #<Ingredient:0x00007faae6a207e0...>
  #
  # pry(main)> ingredient2 = Ingredient.new(name: "Macaroni", unit: "oz", calories: 30)
  # # => #<Ingredient:0x00007faae69e3cf0...>
  #
  # pry(main)> recipe1 = Recipe.new("Mac and Cheese")
  # # => #<Recipe:0x00007faae69c9698...>
  #
  # pry(main)> recipe1.add_ingredient(ingredient1, 2)
  #
  # pry(main)> recipe1.add_ingredient(ingredient2, 8)
  #
  # pry(main)> ingredient3 = Ingredient.new(name: "Ground Beef", unit: "oz", calories: 100)
  # # => #<Ingredient:0x00007faae6950860...>
  #
  # pry(main)> ingredient4 = Ingredient.new(name: "Bun", unit: "g", calories: 1)
  # # => #<Ingredient:0x00007faae694bb80...>
  #
  # pry(main)> recipe2 = Recipe.new("Burger")
  # # => #<Recipe:0x00007faae692a110...>
  #
  # pry(main)> recipe2.add_ingredient(ingredient3, 4)
  #
  # pry(main)> recipe2.add_ingredient(ingredient4, 100)
  #
  # pry(main)> cookbook.add_recipe(recipe1)
  #
  # pry(main)> cookbook.add_recipe(recipe2)
  #
  # pry(main)> cookbook.summary
  # # => [{:name=>"Mac and Cheese", :details=>{:ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"}, {:ingredient=>"Cheese", :amount=>"2 C"}], :total_calories=>440}}, {:name=>"Burger", :details=>{:ingredients=>[{:ingredient=>"Ground Beef", :amount=>"4 oz"}, {:ingredient=>"Bun", :amount=>"100 g"}], :total_calories=>500}}]
  # ```

end
