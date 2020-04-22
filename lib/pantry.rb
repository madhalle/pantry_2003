class Pantry
  attr_reader :stock
  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end


  def enough_ingredients_for?(recipe)
    return_value = nil
    recipe.ingredients_required.each do |ingredient, quantity|
      return_value = (stock.include?(ingredient) == true) && (stock[ingredient] >= quantity)
    end
    return_value
  end
end
