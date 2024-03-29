require "administrate/base_dashboard"

class GiftDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo.with_options(class_name: 'User', searchable: true, searchable_field: 'last_name'),
    student: Field::BelongsToSearch.with_options(class_name: 'Student'),
    id: Field::Number,
    state: Field::String,
    product_sku: Field::String,
    gift_to: Field::String,
    gift_from: Field::String,
    payment: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    amount_cents: Field::Number
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  id
  state
  product_sku
  gift_to
  gift_from
  user
  created_at
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  id
  state
  product_sku
  gift_to
  gift_from
  user
  student
  created_at
  amount_cents
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  id
  state
  product_sku
  gift_to
  gift_from
  student
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

  # Overwrite this method to customize how gifts are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(gift)
    "Bon cadeau ##{gift.id}"
  end
end
