class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.integer :concert_id
      t.string :name
      t.string :link
      t.string :text
      t.boolean :global, default: false

      t.timestamps
    end
    add_index :partners, :concert_id
  end
end
