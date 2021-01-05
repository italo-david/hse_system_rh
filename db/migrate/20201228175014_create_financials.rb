class CreateFinancials < ActiveRecord::Migration[5.2]
  def change
    create_table :financials do |t|
      t.float :hourvalue
      t.string :description

      t.timestamps
    end
  end
end
