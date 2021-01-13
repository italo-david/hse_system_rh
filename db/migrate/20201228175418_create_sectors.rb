class CreateSectors < ActiveRecord::Migration[5.2]
  def change
    create_table :sectors do |t|
      t.string :description
      t.string :initials
      t.string :parentsector
      t.string :collaboratorresp

      t.timestamps
    end
  end
end
