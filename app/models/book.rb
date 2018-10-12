class Book < ApplicationRecord
  has_many :user_books, through: :books
  has_many :user_wishlists, through: :books
end
