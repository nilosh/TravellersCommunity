class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :review
      t.references :user, null: false, foreign_key: true
      t.references :trip_detail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
