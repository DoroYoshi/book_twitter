class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  has_many :reviews

  has_many :favorites
  has_many :favrevs, through: :favorites, source: :review

  # def like(review)
  #   favorites.find_or_create_by(review_id: review.id)
  # end

  # def unlike(review)
  #   favorite = favorites.find_by(review_id: review.id)
  #   favorite.destroy if favorite
  # end

  # def favrev?(review)
  #   self.favrevs.include?(review)
  # end
  
end
