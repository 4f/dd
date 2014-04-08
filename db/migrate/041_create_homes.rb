class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :title
      t.string :title2
      t.text :preText
      t.text :postText
      t.date  :date

      t.timestamps
    end
  end
end
