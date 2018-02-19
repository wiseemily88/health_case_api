class CreateUserImmunizationHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :user_immunization_histories do |t|
      t.text :note
      t.references :user, foreign_key: true
      t.references :immunization, foreign_key: true
      t.date :date
    end
  end
end
