class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title, null: false, length: 50
      t.date :reading_date, null: false
      t.float :evaluation
      t.text :description, null: false, length: 140
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :reviews, [:book_id, :user_id], unique: true
  end
end
