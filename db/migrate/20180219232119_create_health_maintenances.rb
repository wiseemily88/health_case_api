class CreateHealthMaintenances < ActiveRecord::Migration[5.1]
  def change
    create_table :health_maintenances do |t|
      t.string :name
    end
  end
end
