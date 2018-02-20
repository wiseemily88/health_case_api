class CreateUserHealthMaintenances < ActiveRecord::Migration[5.1]
  def change
    create_table :user_health_maintenances do |t|
      t.text :note
      t.date :date
      t.references :user, foreign_key: true
      t.references :health_maintenance, foreign_key: true
      t.timestamps
    end
  end
end
