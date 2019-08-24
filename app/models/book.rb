class Book < ApplicationRecord
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  has_one_attached :image
  attribute :new_image

  validates :title, presence: true, length: { maximum: 50 }
  validates :reading_date, presence: true
  validates :description, presence: true, length: { maximum: 140 }

  before_save do
    self.image = new_image if new_image
  end
end