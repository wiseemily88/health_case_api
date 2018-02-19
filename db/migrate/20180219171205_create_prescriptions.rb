class CreatePrescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :prescriptions do |t|
      t.string :name
      t.string :dosage
      t.string :frequency
      t.text :note
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
