class CookBook
  attr_reader :recipes
  def initialize
    @recipes = []
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

end
