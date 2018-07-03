class CreateSituations < ActiveRecord::Migration[5.2]

  def change
    create_table :situations do |t|
      t.string :name,           limit: 128, null: false
      t.string :code,           limit: 16,  null: false
      t.string :description,    limit: 1024
      t.boolean :status,                    null: false, default: true
      t.boolean :instantaneous,             null: false, default: false
      t.references :event, foreign_key: true

      t.timestamps
    end

    add_index :situations, :code, unique: true
  end

end
