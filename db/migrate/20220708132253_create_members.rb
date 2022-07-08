class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :name
      t.references :rota, null: false, foreign_key: true, index: false
      t.integer :priority

      t.index [:rota_id, :priority]

      t.timestamps
    end
  end
end
