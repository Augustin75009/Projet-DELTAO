Product.destroy_all
Purchase.destroy_all
puts 'Creating Users'
Product.create!(
  name: 'Bol à Thé',
  description: "Faïence pincée, jetés et superpositions d'émail",
  price: 20,
  quantity: 10,
  photo: 'bolathe.jpg'
)

