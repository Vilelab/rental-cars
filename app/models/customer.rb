class Customer < ApplicationRecord
  has_many :rentals
  has_many :car_categories
end
