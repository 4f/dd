class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.belongs_to :concert
      t.string :name
      t.string :link
      t.attachment :foto
      t.belongs_to :flag
      t.string :city
      t.string :remark
      t.integer :role

      t.timestamps
    end
    add_index :members, :concert_id
    add_index :members, :role
  end
end
