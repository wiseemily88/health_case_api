class CreateImmunizations < ActiveRecord::Migration[5.1]
  def change
    create_table :immunizations do |t|
    t.string :name

    end
  end
end
