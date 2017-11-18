Product.destroy_all
Review.destroy_all

#seeding products
50.times do
  Product.create( title: Faker::Beer.unique.name,
                  cost: Faker::Number.between(5, 100),
                  country: Faker::RickAndMorty.location )
end

p "Created #{Product.count} products"

#seeding reviews
250.times do
  Review.create!(author: Faker::Simpsons.character,
                 product_id: Faker::Number.between(Product.first.id, Product.last.id),
                 content: Faker::Lorem.characters(50..250),
                 rating: Faker::Number.between(1, 5))
end

p "Created #{Review.count} reviews"
