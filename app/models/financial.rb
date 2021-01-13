class Financial < ApplicationRecord

  validates :hourvalue, presence: true

  #KAMINARI
  paginates_per 5
end
