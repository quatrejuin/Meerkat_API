# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
User.create(name: 'api', email: 'api@aceworld.com.au', password: '123456',token:'YF1MNSZNvpN71U6oq71zUSJy')

Product.destroy_all
Product.create(
       name:'Tea',
       sku:'sku001',
       price:'11',
       quantity:'1000'
)
Product.create(
       name:'iPhone',
       sku:'sku002',
       price:'599',
       quantity:'59'
)