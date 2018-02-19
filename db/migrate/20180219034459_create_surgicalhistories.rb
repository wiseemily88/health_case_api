class CreateSurgicalhistories < ActiveRecord::Migration[5.1]
  def change
    create_table :surgical_histories do |t|
      t.text :name
    end
  end
end
