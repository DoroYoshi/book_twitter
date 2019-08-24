class ReviewsController < ApplicationController
  before_action :set_book, only: [:new, :create]
  
  def new
    @review = Review.new
  end 
  
  def create
    @review = Review.new(review_params)
    @review.attributes = {
      book_id: params[:book_id],
      user_id: current_user.id
    }
    if @review.save
      redirect_to @review.book, notice: "レビューを書き込みました。"
    else
      render :new
    end
  end 
  
  private 
  
  def review_params
    params.require(:review).permit(:title, :reading_date, :evaluation, :description)
  end 
  
  def set_book
    @book = Book.find(params[:book_id])
  end
end