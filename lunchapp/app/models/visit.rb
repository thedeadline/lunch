class Visit < ApplicationRecord
  belongs_to :food_truck

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)

    # ActiveRecord::Base.transaction do
      spreadsheet.each_with_index do |ro, i|
        puts "ro: #{ro}"
        puts "i: #{i}"
        # binding.pry
        next if i == 0
        row = Hash[[header, ro].transpose]
        visit = Visit.new
        visit.location = row['location']

        # visit.location = 'lame'
        # visit = find_by_id(row['id']) || new
        food_truck_name = row['food_truck']
        food_truck = FoodTruck.where(name: food_truck_name).take

        unless food_truck
          food_truck = FoodTruck.create!(name: food_truck_name)
        end
# FoodTruck.find_by(name: name)
        visit.food_truck = food_truck

         #FoodTruck.find_by_name(row['food_truck']).id
         # || FoodTruck.create!(name: row['food_truck']).id
  # binding.pry
  #TODO ISO time format
        visit.arrival_time = row['arrival_time']
        visit.departure_time = row['departure_time'].to_datetime
        visit.location = row['location']
  #
        visit.status = 'On Time'
        # visit.attributes = row.to_hash.slice(*attribute_accessor)
        visit.save!
      end
    # end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::CSV.new(file.path)
    when '.xls' then Roo::Excel.new(file.path)
    when '.xlsx' then Roo::Excelx.new(file.path)
    else raise 'Unknown file type: #{file.original_filename}'
    end
  end
end

# next if i == 0
# row = Hash[[header, ro].transpose]
#
# visit = find_by_id(row['id']) || new
# visit.food_truck = FoodTruck.find_by_name(row['food_truck']) || FoodTruck.create!(name: row['food_truck'])
# binding.pry
# visit.arrival_time = row['arrival_time'].to_datetime
# visit.departure_time = row['departure_time'].to_datetime
# visit.location = row['location']
#
# visit.status = 'On Time'
