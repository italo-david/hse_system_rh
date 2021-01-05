class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :typo
      t.string :description

      t.timestamps
    end
  end
end
