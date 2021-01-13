class Function < ApplicationRecord
  validates :namefunction, presence: true

  #KAMINARI
  paginates_per 5
end
