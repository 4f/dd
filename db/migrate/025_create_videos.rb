class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.belongs_to :concert
      t.string :link

      t.timestamps
    end
    add_index :videos, :concert_id
  end
end
