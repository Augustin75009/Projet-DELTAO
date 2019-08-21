class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :password, length: { minimum: 6 }, if: :password_required?

  # def password_required?
  #   new_record? || password.present?
  # end

  has_many :purchases, dependent: :destroy
  has_many :lessons, dependent: :nullify
  has_many :carts, dependent: :destroy
  has_many :cart_items, dependent: :destroy
end
