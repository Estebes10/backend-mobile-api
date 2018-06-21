class CreateRequests < ActiveRecord::Migration[5.2]

  def change
    create_table :requests do |t|
      t.string  :name,        limit: 64,   null: false
      t.string  :description, limit: 1024, null: false
      t.string  :code,        limit: 16,   null: false
      t.boolean :status,                   null: false, default: true

      t.timestamps
    end

    add_index :requests, :code, unique: true
  end

end
