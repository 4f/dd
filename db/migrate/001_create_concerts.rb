class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.integer :year
      t.string :title
      t.text :text1
      t.text :text2
      t.text :text3

      t.timestamps
    end
  end
end
