User.destroy_all
Product.destroy_all
Purchase.destroy_all
puts 'Creating Users'

diane = User.create!(first_name: "Diane", email: 'diane@gmail.com', password: 'dianejr')
augustin = User.create!(first_name: "Augustin", email: 'augustin@gmail.com', password: 'augstin')

Product.create!(
  name: 'Bol à Thé',
  description: "Faïence pincée, jetés et superpositions d'émail",
  price: 20,
  quantity: 10,
  photo: 'bolathe.jpg'
)

