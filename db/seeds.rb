puts 'Destroying_all'
Purchase.destroy_all
Cart.destroy_all
CartItem.destroy_all
Lesson.destroy_all
Event.destroy_all
User.destroy_all
Product.destroy_all
puts 'Creating Users'

tessa = User.create!(first_name: "Tessa", email: 'tessa@gmail.com', password: 'tessa2019', adminkey: 'admin')
augustin = User.create!(first_name: "Augustin", email: 'augustin@gmail.com', password: 'augustin', adminkey: 'admin')
user = User.create!(first_name: "User", email: 'user@gmail.com', password: 'user2019', adminkey: 'user')

# Products ------------------------------------------------------------------------------
#
# Lessons -------------------------------------------------------------------------------
puts 'Creating Lessons'


lesson1 = Lesson.create!(
  title: 'Modelage et mise en forme',
  description: "Par groupe de 5 ou 6, les enfants déploient leur créativité à travers différents thèmes et situations de modelages proposés : l'animal de mes rêves, le bol animé, auto-portrait....",
  price_cents: 20000,
  quantity: 2,
  slot: ["04-04-2019", "05-05-2019"],
  category: 'Atelier adultes',
  adult: true,
  child: false,
  phone_booking: true,
  payable: false,
  online_booking: false,
  gift_card: false,
  user_id: "#{tessa.id}",
  card_description: "Hello, je suis la description qui apparaitra sur la carte",
  pricing: "60€ par binôme, 20€ par enfant supplémentaire\n
95€ les 2 séances dont une séance émaillage.\n
Tarif spécial 'famille au complet' papa, maman et le 'petit d'homme' : 95€ la séance, 140€ les 2 séances. 20€ pour un enfant supplémentaire.\n
Terre et cuissons comprises."
)

lesson1.remote_photo_url = "http://res.cloudinary.com/dw7nokc0j/image/upload/v1555484431/anpk1xgewzblddekmmg0.jpg"
lesson1.save!

lesson2 = Lesson.create!(
  title: 'Parents & Enfants',
  description: "Enfants solo ou en famille, 1h30 d'ateliers pour modeler son imaginaire.",
  price_cents: 20000,
  quantity: 2,
  slot: ["04-04-2019", "05-05-2019"],
  category: 'Atelier enfant',
  adult: true,
  child: true,
  phone_booking: false,
  payable: true,
  online_booking: false,
  gift_card: false,
  user_id: "#{tessa.id}",
  card_description: "Hello, je suis la description qui apparaitra sur la carte",
  pricing: "60€ par binôme, 20€ par enfant supplémentaire\n
95€ les 2 séances dont une séance émaillage.\n
Tarif spécial 'famille au complet' papa, maman et le 'petit d'homme' : 95€ la séance, 140€ les 2 séances. 20€ pour un enfant supplémentaire.\n
Terre et cuissons comprises."
)

lesson2.remote_photo_url = "http://res.cloudinary.com/dw7nokc0j/image/upload/v1555486445/bffulk7dmvhn0l1hnss0.jpg"
lesson2.save!

lesson3 = Lesson.create!(
  title: 'Le temps d\'un après-midi',
  description: 'A l\'occasion d\'un anniversaire, pour les samedi ou dimanche pluvieux de l\'automne...l\'atelier ouvre ses portes le temps d\'un après-midi pour des groupes de 6-7 enfants....
                Vous choisissez la "situation créative" que vous souhaitez : ',
  price_cents: 20000,
  quantity: 2,
  slot: ["04-04-2019", "05-05-2019"],
  category: 'Entre amis & anniversaire',
  adult: true,
  child: true,
  phone_booking: true,
  payable: false,
  online_booking: false,
  gift_card: false,
  user_id: "#{tessa.id}",
  card_description: "Hello, je suis la description qui apparaitra sur la carte",
  pricing: "60€ par binôme, 20€ par enfant supplémentaire\n
95€ les 2 séances dont une séance émaillage.\n
Tarif spécial 'famille au complet' papa, maman et le 'petit d'homme' : 95€ la séance, 140€ les 2 séances. 20€ pour un enfant supplémentaire.\n
Terre et cuissons comprises."
)

lesson3.remote_photo_url = "https://res.cloudinary.com/dw7nokc0j/image/upload/v1555313957/DSC_2960.jpg"
lesson3.save!

lesson4 = Lesson.create!(
  title: 'Tournage',
  description: 'Cours particuliers ou par deux , vous découvrez les gestes pour tourner un pot, une assiette, une tasse. Idéal pour débuter ou améliorer votre pratique.',
  price_cents: 20000,
  quantity: 2,
  slot: ["04-04-2019", "05-05-2019"],
  category: 'Découverte',
  adult: true,
  child: false,
  phone_booking: false,
  payable: true,
  online_booking: true,
  gift_card: true,
  user_id: "#{tessa.id}",
  card_description: "Hello, je suis la description qui apparaitra sur la carte",
  pricing: "60€ par binôme, 20€ par enfant supplémentaire\n
95€ les 2 séances dont une séance émaillage.\n
Tarif spécial 'famille au complet' papa, maman et le 'petit d'homme' : 95€ la séance, 140€ les 2 séances. 20€ pour un enfant supplémentaire.\n
Terre et cuissons comprises."
)

lesson4.remote_photo_url = "http://res.cloudinary.com/dw7nokc0j/image/upload/v1555484892/bzf4sevz0y1isv7eczvi.jpg"
lesson4.save!

lesson5 = Lesson.create!(
  title: 'Expérimentations',
  description: 'Par groupe de 4-5 personnes : découvrir sa créativité en vivant les "situations" de modelage proposées. En même temps apprendre les techiques et les gestes pour créer en terre de faïence.
                Tous les niveaux sont les bienvenus, de l\'expérimenté au débutant. Dans tous les cas vous découvrirez comment reperer le fil rouge de votre style créatif.',
  price_cents: 20000,
  quantity: 2,
  slot: ["04-04-2019", "05-05-2019"],
  category: 'Découverte',
  adult: true,
  child: true,
  phone_booking: false,
  payable: true,
  online_booking: true,
  gift_card: true,
  user_id: "#{tessa.id}",
  card_description: "Hello, je suis la description qui apparaitra sur la carte",
  pricing: "60€ par binôme, 20€ par enfant supplémentaire\n
95€ les 2 séances dont une séance émaillage.\n
Tarif spécial 'famille au complet' papa, maman et le 'petit d'homme' : 95€ la séance, 140€ les 2 séances. 20€ pour un enfant supplémentaire.\n
Terre et cuissons comprises."
)

lesson5.remote_photo_url = "http://res.cloudinary.com/dw7nokc0j/image/upload/v1555485540/gle17tocw5gv8umyfcmk.jpg"
lesson5.save!


# Events -------------------------------------------------------------------------------
puts 'Creating Events'

event1 = Event.create!(
  title: 'Vente de Nouvel An',
  description: 'Pour vos petits cadeaux de Nouvelle Année, pensez aux  créations artistiques et artisanales.',
  start_date: "Thu, 29 Jan 2019 16:50:20 +0100",
  end_date: "Thu, 30 Jan 2019 16:50:20 +0100",
  photo: 'https://res.cloudinary.com/dw7nokc0j/image/upload/v1552919569/pic2.jpg',
  user_id: "#{tessa.id}",
  location: 'Paris, France'
)

event1.save!

event2 = Event.create!(
  title: 'Modelage en famille',
  description: 'Pour vos petits cadeaux de Nouvelle Année, pensez aux  créations artistiques et artisanales.',
  start_date: "Thu, 4 Feb 2019 16:50:20 +0100",
  end_date: "Thu, 5 Feb 2019 16:50:20 +0100",
  photo: 'https://res.cloudinary.com/dw7nokc0j/image/upload/v1554391528/modelage_en_famille.jpg',
  user_id: "#{tessa.id}",
  location: 'Paris, France'
)

event2.save!

event3 = Event.create!(
  title: 'Modelage enfant',
  description: 'Pour vos petits cadeaux de Nouvelle Année, pensez aux  créations artistiques et artisanales.',
  start_date: "Thu, 8 Feb 2019 16:50:20 +0100",
  end_date: "Thu, 8 Feb 2019 18:50:20 +0100",
  photo: 'https://res.cloudinary.com/dw7nokc0j/image/upload/v1554391521/enfant_modelage.jpg',
  user_id: "#{tessa.id}",
  location: 'Paris, France'
)

event3.save!

event4 = Event.create!(
  title: 'Stage adulte',
  description: 'Pour vos petits cadeaux de Nouvelle Année, pensez aux  créations artistiques et artisanales.',
  start_date: "Thu, 8 Feb 2019 16:50:20 +0100",
  end_date: "Thu, 8 Feb 2019 18:50:20 +0100",
  photo: 'https://res.cloudinary.com/dw7nokc0j/image/upload/v1554391512/delaterrealobjet_tessa_guilbaud.jpg',
  user_id: "#{tessa.id}",
  location: 'Paris, France'
)

event4.save!










