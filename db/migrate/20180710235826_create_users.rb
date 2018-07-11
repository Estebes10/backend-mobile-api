class CreateUsers < ActiveRecord::Migration[5.2]

  def change
    create_table :users do |t|
      t.string :name,     limit: 128, null: false
      t.string :lastname, limit: 128, null: false
      t.string :email,    limit: 128, null: false
      t.string :phone,    limit: 32,  null: false
      t.string :address,  limit: 256, null: false

      t.timestamps
    end

    add_index :users, [:phone, :email], unique: true
  end

end
