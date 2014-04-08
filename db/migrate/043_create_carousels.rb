class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
      t.belongs_to :concert
      t.belongs_to :foto
      t.belongs_to :video
      t.integer :number
      t.integer :show_index
      t.timestamps
    end
    add_index :carousels, :concert_id
    add_index :carousels, :foto_id
    add_index :carousels, :show_index
  end
end
