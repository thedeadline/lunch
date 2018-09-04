class CreateFoodTrucks < ActiveRecord::Migration[5.2]
  def change
    create_table :food_trucks do |t|

      t.timestamps
    end
  end
end
