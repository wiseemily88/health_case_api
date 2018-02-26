class AddColumnstoSurgicalTable < ActiveRecord::Migration[5.1]
  def change
  add_column :surgical_histories, :date, :date
  add_column :surgical_histories, :location, :text
  end
end
