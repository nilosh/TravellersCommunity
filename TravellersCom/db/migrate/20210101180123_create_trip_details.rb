class CreateTripDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :trip_details do |t|
      t.string :location
      t.date :startDate
      t.date :endDate
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
