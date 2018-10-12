class Api::V1::BooksController < ApplicationController
  # before_action :authenticate, only: [:index]
  def index
    books = Book.all
    render json: books
  end

  def create
    @book = Book.new

    @book.title = params[:title]
    @book.author = params[:author]
    @book.synopsis = params[:synopsis]
    @book.rating = params[:rating]


    if (@book.save)
      render json: {
        title: @book.title,
        author: @book.author,
        synopsis: @book.synopsis,
        rating: @book.rating,
      }
    else
      render json: {
        errors: @book.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  # def currentbook
  #   @book = Book.find_by(id: get_token_payload('sub'))
  #
  #   if (!!@book)
  #     render json: @book
  #   else
  #     render json: {
  #       message: 'Invalid token.'
  #     }, status: :unauthorized
  #   end
  # end

  private
    def book_params
      params.require(:book).permit(:title, :author, :synopsis, :rating)
    end
end
