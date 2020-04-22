class CookBook
  attr_reader :recipes, :date
  def initialize
    @recipes = []
    @date = Time.new.strftime("%m-%d-%Y").freeze
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    @recipes.flat_map do |recipe|
      recipe.ingredients.map do |ingredient|
        ingredient.name
      end
    end.uniq
  end

  def highest_calorie_meal
    @recipes.max do |recipe|
      recipe.total_calories
    end
  end
  def recipe_ingredients_and_calories_hash(recipe)
    ingredients_and_calories = Hash.new

    ingredients_and_calories[:ingredients] = []
    ingredients_and_calories[:calories] = recipe.total_calories
    ingredients_and_calories
  end
  def ingredient_hash(recipe)
    ingredient_hash = Hash.new
    recipe.ingredients_required.map do |ingredient, quantity|
      ingredient_hash[:name] = ingredient.name
      ingredient_hash[:amount] = "#{quantity}" + " " +ingredient.unit
      ingredient_hash
    end

  end
  def add_ingredient_info_to_ingredients_hash(recipe)
    recipe_ingredients_and_calories_hash(recipe)


  end

  def recipe_details(recipe)
    recipe_details = Hash.new
    recipe_details[:name] = recipe.name
    recipe_details[:details] = recipe_ingredients_and_calories_hash(recipe)
  end

  def summary
    summary = []

    @recipes.map do |recipe|
      add_ingredient_info_to_ingredients_hash(recipe).flatten
      summary << recipe_details(recipe)
      require "pry"; binding.pry
    end


  end


end
