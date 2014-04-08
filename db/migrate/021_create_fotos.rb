class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.belongs_to :concert
      t.belongs_to :albom
      t.attachment :image

      t.timestamps
    end
    add_index :fotos, :concert_id
    add_index :fotos, :albom_id
  end
end
