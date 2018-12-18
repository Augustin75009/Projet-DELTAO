User.destroy_all
Product.destroy_all
Purchase.destroy_all
puts 'Creating Users'

diane = User.create!(first_name: "Diane", email: 'diane@gmail.com', password: 'dianejr')
augustin = User.create!(first_name: "Augustin", email: 'augustin@gmail.com', password: 'augustin')

product1 = Product.create!(
  name: 'Bol à Thé',
  description: "Faïence pincée, jetés et superpositions d'émail",
  price: 20,
  quantity: 10
)

product1.remote_photo_url = "https://res.cloudinary.com/desykbhe3/image/upload/v1545125666/Capture_d_e%CC%81cran_2018-12-18_a%CC%80_10.31.11.png"
product1.save!

product2 = Product.create!(
  name: 'Bol',
  description: "Faïence pincée, jetés et superpositions d'émail",
  price: 20,
  quantity: 10
)

product2.remote_photo_url = "https://res.cloudinary.com/desykbhe3/image/upload/v1545125666/Capture_d_e%CC%81cran_2018-12-18_a%CC%80_10.31.36.png"
product2.save!

product3 = Product.create!(
  name: 'Vase',
  description: "Faïence pincée, jetés et superpositions d'émail",
  price: 20,
  quantity: 10
)

product3.remote_photo_url = "https://res.cloudinary.com/desykbhe3/image/upload/v1545125666/Capture_d_e%CC%81cran_2018-12-18_a%CC%80_10.31.58.png"
product3.save!

product4 = Product.create!(
  name: 'Table',
  description: "Faïence pincée, jetés et superpositions d'émail",
  price: 20,
  quantity: 10
)

product4.remote_photo_url = "https://res.cloudinary.com/desykbhe3/image/upload/v1545125666/Capture_d_e%CC%81cran_2018-12-18_a%CC%80_10.31.31.png"
product4.save!

