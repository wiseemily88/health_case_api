class CreateUserMedicalHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :user_medical_histories do |t|
      t.references :user, foreign_key: true
      t.references :medical_history, foreign_key: true

      t.timestamps
    end
  end
end
