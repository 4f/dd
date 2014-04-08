class CreateMailics < ActiveRecord::Migration
  def change
    create_table :mailics do |t|
      t.integer :tipo
      t.string :name
      t.string :age
      t.string :phone
      t.string :email
      t.text :text

      t.timestamps
    end
    add_index :mailics, :created_at
  end
end
