class CreateAlboms < ActiveRecord::Migration
  def change
    create_table :alboms do |t|
      t.belongs_to :concert
      t.string :title
      t.text :text
      t.text :tumba

      t.timestamps
    end
    add_index :alboms, :concert_id
  end
end
