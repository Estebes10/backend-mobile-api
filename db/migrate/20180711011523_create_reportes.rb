class CreateReportes < ActiveRecord::Migration[5.2]

  def change
    create_table :reportes do |t|
      t.date :date,                 null: false, default: Time.now.year.to_s + "-" + Time.now.month.to_s + "-" + Time.now.day.to_s
      t.string :hour,               null: false, default: Time.now.strftime("%H:%M:%S")
      t.text :description,                       default: 'N/A'
      t.text :attachments,                       default: [],            array: true
      t.string :folio
      t.string :zip_code,                        default: 'N/A'
      t.string :street,             null: false, default: 'N/A'
      t.string :house_number,                    default: 'N/A'
      t.string :colony,             null: false, default: 'N/A'
      t.string :requester_name,                  default: 'N/A'
      t.string :requester_lastname,              default: 'N/A'
      t.text :people_involved,                   default: [],            array: true
      t.integer :user_id
      t.integer :situation_id,      null: false
      t.boolean :active,                         default: true

      t.timestamps
    end

    add_index :reportes, :folio, unique: true
  end

end
