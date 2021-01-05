class CreateBonds < ActiveRecord::Migration[5.2]
  def change
    create_table :bonds do |t|
      t.string :company
      t.date :admission
      t.string :description
      t.string :responsible

      t.timestamps
    end
  end
end
