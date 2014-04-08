class CreateNewsRubrics < ActiveRecord::Migration
  def change
    create_table :news_rubrics do |t|
      t.string :name
      t.timestamps
    end
  end
end
