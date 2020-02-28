class BooksController < ApplicationController
  before_action :set_book, only: :show

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @comments = @book.comments.includes(:user)
    @tags = @book.tags.includes(books: [:book_tags])
    @related_books = @tags.flat_map(&:books).reject { |book| book == @book }.uniq.take(3)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.includes(:tags).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.fetch(:book, {})
    end
end
