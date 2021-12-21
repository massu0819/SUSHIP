class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :postimage_id
      t.string :name, null: false
      t.string :address, null: false
      t.text :caption, null: false
      t.integer :customer_id

      t.timestamps
    end
  end
end
