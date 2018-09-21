class FoodTruck < ApplicationRecord
  has_many :visits

  # def self.find_or_create_from_spreadsheet(row)
  #     foodtruck.name = row
  #     # foodtruck.address = row.address
  #     # foodtruck.phone = row.phone
  #     # foodtruck.website = row.website
  #     foodtruck.save!
  # end
end
