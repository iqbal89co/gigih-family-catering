# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Category.create(name: "Indonesian Cuisine")
Menu.create(
  name: "Nasi Uduk",
  description: "Betawi style steamed rice cooked in coconut milk. Delicious!",
  price: 15000.0
)
MenuCategory.create(
    menu_id: 1,
    category_id: 1
)