# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")


require 'json'
require 'open-uri'

Cocktail.destroy_all

url = "https://raw.githubusercontent.com/teijo/iba-cocktails/master/recipes.json"
cocktails_serialized = open(url).read
cocktails = JSON.parse(cocktails_serialized)
cocktails.first(10).each do |cocktail|
Cocktail.create(name: cocktail['name'])
end

# Ingredient.destroy_all

# url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
# ingredients_serialized = open(url).read
# ingredients = JSON.parse(ingredients_serialized)

# ingredients["drinks"].each do |ingredient|
# Ingredient.create(name: ingredient['strIngredient1'])
# end

