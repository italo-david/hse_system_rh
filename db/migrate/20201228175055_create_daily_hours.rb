class CreateDailyHours < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_hours do |t|
      t.string :shift
      t.string :description

      t.timestamps
    end
  end
end
