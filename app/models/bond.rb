class Bond < ApplicationRecord
  
  validates :company, presence: true
  #KAMINARI
  paginates_per 5
end
