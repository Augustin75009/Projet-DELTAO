require "administrate/base_dashboard"

class LessonDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    cart_items: Field::HasMany,
    slots: Field::HasMany,
    user: Field::BelongsTo,
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    quantity: Field::Number,
    photo: Field::PaperclipField,
    photo_1: Field::Paperclip1Field,
    photo_2: Field::Paperclip2Field,
    price_cents: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    category: Field::CategoryField,
    adult: Field::Boolean,
    child: Field::Boolean,
    phone_booking: Field::Boolean,
    payable: Field::Boolean,
    gift_card: Field::Boolean,
    card_description: Field::Text,
    pricing: Field::Text,
    slot: Field::String,
    schedule: Field::Text,
    deposit: Field::Number,
    pic_position: Field::String,
    alt: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  id
  title
  category
  payable
  gift_card
  price_cents
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  id
  title
  price_cents
  category
  description
  adult
  child
  phone_booking
  payable
  gift_card
  pic_position
  alt
  slots
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  title
  price_cents
  category
  description
  adult
  child
  phone_booking
  payable
  gift_card
  photo
  photo_1
  photo_2
  card_description
  pricing
  schedule
  pic_position
  alt
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how lessons are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(lesson)
    "#{lesson.title}"
  end
end
