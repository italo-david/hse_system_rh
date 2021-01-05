class User < ApplicationRecord
  
  ROLES = {:default => 0, :papaya => 1, :manager => 2 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      
    enum role: ROLES
    enum status: [:active , :inactive ]

  #Validations
  validates :name, presence: true, length: {minimum: 3}, on: :update

   #KAMINARI
   paginates_per 5
   
end
