# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#requires added in webpack require.
require 'open-uri'
require 'json'

Ingredient.destroy_all

json_string = open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read

ingredients_hash = JSON.parse(json_string)


ingredients_hash["drinks"].each do |ingredient|
  # item = JSON.parse(ingredient)
  Ingredient.create(name: ingredient["strIngredient1"])
end

puts "created #{Ingredient.count} incredients"




