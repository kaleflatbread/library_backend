class User < ApplicationRecord
  # validates :first_name, :last_name, :role, :email, :password, presence: true
  # validates :email, uniqueness: true
  has_secure_password
  has_many :books, through: :user_books
  has_many :books, through: :user_wishlists
end
