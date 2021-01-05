class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :document
      t.integer :role
      t.integer :status
      t.text :notes

      t.timestamps
    end
  end
end