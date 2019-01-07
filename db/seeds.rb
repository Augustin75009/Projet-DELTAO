Cart.destroy_all
User.destroy_all
Product.destroy_all
Purchase.destroy_all
puts 'Creating Users'

diane = User.create!(first_name: "Diane", email: 'diane@gmail.com', password: 'dianejr')
augustin = User.create!(first_name: "Augustin", email: 'augustin@gmail.com', password: 'augustin')

# Products ------------------------------------------------------------------------------
puts 'Creating Products'

product1 = Product.create!(
  name: 'Bol à Thé',
  description: "Faïence pincée, jetés et superpositions d'émail",
  price_cents: 20000,
  quantity: 10,
  category: 'A table'
)

product1.remote_photo_url = "https://res.cloudinary.com/desykbhe3/image/upload/v1545125666/Capture_d_e%CC%81cran_2018-12-18_a%CC%80_10.31.11.png"
product1.save!

product2 = Product.create!(
  name: 'Bol ',
  description: "Faïence pincée, jetés et superpositions d'émail",
  price_cents: 20000,
  quantity: 5,
  category: 'A table'
)

product2.remote_photo_url = "https://res.cloudinary.com/desykbhe3/image/upload/v1545125666/Capture_d_e%CC%81cran_2018-12-18_a%CC%80_10.31.36.png"
product2.save!

product3 = Product.create!(
  name: 'Vase',
  description: "Faïence pincée, jetés et superpositions d'émail",
  price_cents: 20000,
  quantity: 3,
  category: 'Maison'
)

product3.remote_photo_url = "https://res.cloudinary.com/desykbhe3/image/upload/v1545125666/Capture_d_e%CC%81cran_2018-12-18_a%CC%80_10.31.58.png"
product3.save!

product4 = Product.create!(
  name: 'Plateau',
  description: "Faïence pincée, jetés et superpositions d'émail",
  price_cents: 20000,
  quantity: 2,
  category: 'A table'
)

product4.remote_photo_url = "https://res.cloudinary.com/desykbhe3/image/upload/v1545125666/Capture_d_e%CC%81cran_2018-12-18_a%CC%80_10.31.31.png"
product4.save!

product5 = Product.create!(
  name: 'Plateau',
  description: "Faïence pincée, jetés et superpositions d'émail",
  price_cents: 20000,
  quantity: 2,
  category: 'A table'
)

product5.remote_photo_url = "https://res.cloudinary.com/desykbhe3/image/upload/v1545125666/Capture_d_e%CC%81cran_2018-12-18_a%CC%80_10.31.31.png"
product5.save!

product6 = Product.create!(
  name: 'Plateau',
  description: "Faïence pincée, jetés et superpositions d'émail",
  price_cents: 20000,
  quantity: 2,
  category: 'A table'
)

product6.remote_photo_url = "https://res.cloudinary.com/desykbhe3/image/upload/v1545125666/Capture_d_e%CC%81cran_2018-12-18_a%CC%80_10.31.31.png"
product6.save!

# Lessons -------------------------------------------------------------------------------
puts 'Creating Lessons'


lesson1 = Lesson.create!(
  title: 'Atelier "Petites mains"',
  description: "Par groupe de 5 ou 6, les enfants déploient leur créativité à travers différents thèmes et situations de modelages proposés : l'animal de mes rêves, le bol animé, auto-portrait....",
  price_cents: 20000,
  quantity: 2,
  category: 'Atelier enfant'
)

lesson1.remote_photo_url = "https://res.cloudinary.com/desykbhe3/image/upload/v1545125666/Capture_d_e%CC%81cran_2018-12-18_a%CC%80_10.31.31.png"
lesson1.save!

lesson2 = Lesson.create!(
  title: 'Ateliers vacances',
  description: "Enfants solo ou en famille, 1h30 d'ateliers pour modeler son imaginaire.",
  price_cents: 20000,
  quantity: 2,
  category: 'Atelier enfant & adulte'
)

lesson2.remote_photo_url = "https://res.cloudinary.com/desykbhe3/image/upload/v1545125666/Capture_d_e%CC%81cran_2018-12-18_a%CC%80_10.31.31.png"
lesson2.save!

lesson3 = Lesson.create!(
  title: 'Le temps d\'un après-midi',
  description: 'A l\'occasion d\'un anniversaire, pour les samedi ou dimanche pluvieux de l\'automne...l\'atelier ouvre ses portes le temps d\'un après-midi pour des groupes de 6-7 enfants....
                Vous choisissez la "situation créative" que vous souhaitez : ',
  price_cents: 20000,
  quantity: 2,
  category: 'Atelier enfant'
)

lesson3.remote_photo_url = "https://res.cloudinary.com/desykbhe3/image/upload/v1545125666/Capture_d_e%CC%81cran_2018-12-18_a%CC%80_10.31.31.png"
lesson3.save!

lesson4 = Lesson.create!(
  title: 'Modelage et mise en forme',
  description: 'Par groupe de 4-5 personnes : découvrir sa créativité en vivant les "situations" de modelage proposées. En même temps apprendre les techiques et les gestes pour créer en terre de faïence.
                Tous les niveaux sont les bienvenus, de l\'expérimenté au débutant. Dans tous les cas vous découvrirez comment reperer le fil rouge de votre style créatif.',
  price_cents: 20000,
  quantity: 2,
  category: 'Atelier enfant'
)

lesson4.remote_photo_url = "https://res.cloudinary.com/desykbhe3/image/upload/v1545125666/Capture_d_e%CC%81cran_2018-12-18_a%CC%80_10.31.31.png"
lesson4.save!












