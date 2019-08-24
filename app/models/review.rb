class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  enum evaluations: { one: 1, two: 2, three: 3, four: 4, five: 5 }
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :reading_date, presence: true
  validates :evaluation, presence: true
  validates :description, presence: true, length: { maximum: 140 }
  validates_uniqueness_of :book_id, scope: :user_id
end
