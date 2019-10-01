class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false, length: 50
      t.timestamps
    end
  end
end
