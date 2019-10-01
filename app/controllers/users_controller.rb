class UsersController < ApplicationController
  def likes
    @user = User.find(params[:id])
    @favrevs = @user.favrevs.page(params[:page])
    counts(@user)
  end

  def like(review)
    favorites.find_or_create_by(review_id: review.id)
  end

  def unlike(review)
    favorite = favorites.find_by(review_id: review.id)
    favorite.destroy if favorite
  end

  def favrev?(review)
    self.favrevs.include?(review)
  end
end