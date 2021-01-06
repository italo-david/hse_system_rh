class Parking < ApplicationRecord
  STATUSES = {:active => 0, :inactive => 1}
  
  belongs_to :colaborattor

  enum status: STATUSES

  UNRANSACKABLE_ATTRIBUTES = ["created_at", "updated_at"]

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
  
  #KAMINARI
  paginates_per 5
end
