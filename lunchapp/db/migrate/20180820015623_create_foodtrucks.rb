class CreateFoodtrucks < ActiveRecord::Migration[5.2]
  def change
    create_table :foodtrucks do |t|

      t.timestamps
    end
  end
end
