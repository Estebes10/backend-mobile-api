class CreateReportes < ActiveRecord::Migration[5.2]

  def change
    create_table :reportes do |t|
      t.date :date,            null: false, default: Time.now.year.to_s + "-" + Time.now.month.to_s + "-" + Time.now.day.to_s
      t.time :hour,            null: false, default: Time.zone.now
      t.text :description,     null: false
      t.text :attachments,                  default: [],            array: true
      t.string :folio,         null: false
      t.integer :user_id
      t.integer :situation_id, null: false
      t.boolean :active,       null: false, default: true

      t.timestamps
    end

    add_index :reportes, :folio, unique: true
  end

end
