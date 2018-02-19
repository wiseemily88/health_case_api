class CreateFamilyHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :family_histories do |t|
      t.text :name
    
    end
  end
end
