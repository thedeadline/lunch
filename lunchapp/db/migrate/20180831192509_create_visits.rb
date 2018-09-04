class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.references :food_truck, foreign_key: true
      t.datetime :arrival_time
      t.datetime :departure_time
      t.string :location
      t.string :status

      t.timestamps
    end
  end
end
