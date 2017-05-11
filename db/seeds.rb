require 'json'
require 'open-uri'

Ingredient.destroy_all

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredients = JSON.parse(ingredient_serialized)
ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient.values.first)
  puts "Adding #{ingredient.values.first}... "
end
