class CreateColaborattors < ActiveRecord::Migration[5.2]
  def change
    create_table :colaborattors do |t|
      t.string :colaborattorname
      t.integer :matriculation
      t.date :admission
      t.string :address
      t.string :zip_code
      t.string :homenumber
      t.string :cellphone
      t.string :phone
      t.string :email
      t.date :birthdate
      t.string :gender
      t.string :identify
      t.string :cpf
      t.string :instruction
      t.string :professionalqualification
      t.string :classcouncilregistration
      t.integer :crm
      t.integer :status
      t.text :notes
      t.integer :pendecy
      t.references :bond, foreign_key: true
      t.references :daily_hour, foreign_key: true
      t.references :financial, foreign_key: true
      t.references :function, foreign_key: true
      t.references :schedule, foreign_key: true
      t.references :sector, foreign_key: true
      t.references :office, foreign_key: true

      t.timestamps
    end
  end
end
