class CreateNewsFeeds < ActiveRecord::Migration
  def change
    create_table :news_feeds do |t|
      t.string :title
      t.text :preambula
      t.text :text
      t.string :author
      t.date :date

      t.timestamps
    end
  end
end
