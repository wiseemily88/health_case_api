class AddReferencetoSurgicalHistory < ActiveRecord::Migration[5.1]
  def change
   add_reference :surgical_histories, :user, index: true
  end
end
