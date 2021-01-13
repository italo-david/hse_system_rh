class Colaborattor < ApplicationRecord
  validates :colaborattorname, presence: true

  GENDERS = {:male => 0, :female => 1}
  STATUSES = {:active => 0, :inactive => 1}
  PENDECIES = {:complete => 0, :pending => 1}
  INSTRUCTIONS = {:middlelevel => 0, :higherlevel => 1}
  DAILY_HOURS = {:onduty => 0, :daylaborer => 1}

  belongs_to :bond, optional: true
  belongs_to :dailyhour, optional: true
  belongs_to :financial, optional: true
  belongs_to :function, optional: true
  belongs_to :schedule, optional: true
  belongs_to :office, optional: true
  belongs_to :sector, optional: true

  enum gender: GENDERS
  enum status: STATUSES
  enum pendecy: PENDECIES
  enum instruction: INSTRUCTIONS
  enum daily_hour: DAILY_HOURS

  #KAMINARI
  paginates_per 5
end
