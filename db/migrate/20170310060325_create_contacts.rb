class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :surname
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
