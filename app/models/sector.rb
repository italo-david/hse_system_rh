class Sector < ApplicationRecord
  validates :description, presence: true
  #KAMINARI
  paginates_per 5
end
