class CreateNewsFeedRubrics < ActiveRecord::Migration
  def change
    create_table :news_feed_rubrics do |t|
      t.belongs_to :feed
      t.belongs_to :rubric

      t.timestamps
    end
    add_index :news_feed_rubrics, [:feed_id, :rubric_id]
    add_index :news_feed_rubrics, :feed_id
    add_index :news_feed_rubrics, :rubric_id
  end
end
