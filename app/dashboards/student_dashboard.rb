require "administrate/base_dashboard"

class StudentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    signatures: Field::HasMany,
    id: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    address: Field::Text,
    city: Field::String,
    zip: Field::Number,
    phone: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    email: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  first_name
  last_name
  email
  phone
  address
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  first_name
  last_name
  address
  zip
  phone
  email
  signatures
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  first_name
  last_name
  address
  city
  zip
  phone
  email
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

  # Overwrite this method to customize how students are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(student)
    "#{student.first_name} #{student.last_name}"
  end
end
