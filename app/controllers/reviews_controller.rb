class ReviewsController < ApplicationController
  before_action :set_book, only: [:show, :new, :create, :edit]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

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
  
  def show
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review.book, notice: "レビューを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to @review.book, notice: "レビューを削除しました。"
  end
  
  private 
  
  def review_params
    params.require(:review).permit(:title, :reading_date, :evaluation, :description)
  end 
  
  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end
end