class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.timestamps
      t.integer :genre_id, null: false
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :article, null: false
    end
  end
end
