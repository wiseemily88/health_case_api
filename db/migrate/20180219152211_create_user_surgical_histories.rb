class CreateUserSurgicalHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :user_surgical_histories do |t|
      t.text :note
      t.references :user, foreign_key: true
      t.references :surgical_history, foreign_key: true
      t.timestamps
    end
  end
end
