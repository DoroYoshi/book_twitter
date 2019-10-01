class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  # enum evaluations: { one: 1, two: 2, three: 3, four: 4, five: 5 }
  # def which_number?
  #   enum evaluations: { one: 1, opf: 1.5, two: 2, wpf: 2.5, three: 3, tpf: 3.5, four: 4, fpf: 4.5, five: 5 }
  # end

  validates :title, presence: true, length: { maximum: 50 }
  validates :reading_date, presence: true
  validates :evaluation, presence: true
  # validates :evaluation, numericality: true
  validates :description, presence: true, length: { maximum: 140 }
  validates_uniqueness_of :book_id, scope: :user_id

  has_many :favorites, foreign_key: 'review_id', dependent: :destroy
  has_many :users, through: :favorites

end
