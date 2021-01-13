class Schedule < ApplicationRecord
  validates :typo, presence: true

  #KAMINARI
  paginates_per 5
end
