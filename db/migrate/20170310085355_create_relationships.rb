class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :contact_id
      t.integer :relation_id

      t.timestamps
    end
  end
end
