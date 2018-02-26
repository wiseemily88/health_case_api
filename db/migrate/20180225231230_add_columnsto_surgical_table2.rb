class AddColumnstoSurgicalTable2 < ActiveRecord::Migration[5.1]
  def change
  add_column :surgical_histories, :physician, :text
  end
end
