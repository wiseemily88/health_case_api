class RemoveUserSurgicalHistoryTable < ActiveRecord::Migration[5.1]
  def change
  drop_table :user_surgical_histories
  end
end
