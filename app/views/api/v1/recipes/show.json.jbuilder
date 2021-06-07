json.data do
  json.partial! "api/v1/recipes/recipe", recipe: @recipe
  json.foods do
    json.array! @recipe.recipe_foods, partial: "api/v1/recipes/recipe_food", as: :recipe_food
  end
end