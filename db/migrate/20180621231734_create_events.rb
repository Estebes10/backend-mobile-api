class CreateEvents < ActiveRecord::Migration[5.2]

  def change
    create_table :events do |t|
      t.string  :name,        limit: 128, null: false
      t.string  :description, limit: 1024
      t.boolean :status,                  null: false, default: true
      t.string  :code,        limit: 16,  null: false
      t.references :request, foreign_key: true

      t.timestamps
    end

    add_index :events, :code, unique: true
  end

end
