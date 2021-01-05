class CreateParkings < ActiveRecord::Migration[5.2]
  def change
    create_table :parkings do |t|
      t.integer :adhesive
      t.date :stickerreceipt
      t.bigint :cnh
      t.string :vehicle
      t.string :board
      t.string :color
      t.string :modelcar
      t.integer :status
      t.text :notes
      t.bigint :sei
      t.references :colaborattor, foreign_key: true

      t.timestamps
    end
  end
end
