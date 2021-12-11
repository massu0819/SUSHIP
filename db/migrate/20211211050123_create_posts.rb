class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :postimage_id
      t.string :name
      t.string :address
      t.text :caption
      t.integer :customer_id

      t.timestamps
    end
  end
end
