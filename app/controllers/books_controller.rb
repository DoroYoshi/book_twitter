class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :destroy]
  
  def index
    @books = Book.with_attached_image.page(params[:page]).per(4)
  end

  def show
    @book = Book.with_attached_image.includes(review: :user).find(params[:id])
  end
  
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "bookを収納しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "本を再収納しました。"
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: "本棚から外しました。"
  end

  # def favorite
  #   @book.favorite
  #   redirect_to book_path, notice: "お気に入りに登録しました。"
  # end

  private

  def book_params
    params.require(:book).permit(:title, :category_id, :new_image)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
