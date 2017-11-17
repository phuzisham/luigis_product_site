Product.destroy_all
Review.destroy_all

product_list = [
  ["Jazz", 20, "America"],
  ["Rock", 14, "Europe"],
  ["Mongolian Throating", 32, "Mongolia"],
  ["Human", 56, "Africa"],
  ["Rich", 17, "Dubai"],
  ["Poor", 40, "Istanbul"]
]

#seeding products
product_list.each do |title, cost, country|
  Product.create( title: title, cost: cost, country: country )
end

p "Created #{Product.count} products"

#seeding reviews
50.times do
  Review.create!(author: Faker::RockBand.unique.name,
                product_id: Faker::Number.between(Product.first.id, Product.last.id),
                content: Faker::Hipster.unique.sentence(8),
                rating: Faker::Number.between(1, 5))
end

p "Created #{Review.count} reviews"
