class AddNotetoUserMedicalHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :user_medical_histories, :note, :text
  end
end
