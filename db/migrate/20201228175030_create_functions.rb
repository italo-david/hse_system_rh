class CreateFunctions < ActiveRecord::Migration[5.2]
  def change
    create_table :functions do |t|
      t.string :namefunction
      t.text :assignment

      t.timestamps
    end
  end
end
