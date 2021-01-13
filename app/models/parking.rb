class Parking < ApplicationRecord
  validates :adhesive, :board, presence: true

  STATUSES = {:active => 0, :inactive => 1}
  
  belongs_to :colaborattor, optional: true

  enum status: STATUSES

  #KAMINARI
  paginates_per 5
end
