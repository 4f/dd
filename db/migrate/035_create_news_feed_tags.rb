class CreateNewsFeedTags < ActiveRecord::Migration
  def change
    create_table :news_feed_tags do |t|
        t.belongs_to :feed
        t.belongs_to :tag
        t.timestamps
    end

    add_index :news_feed_tags, [:feed_id, :tag_id]
    add_index :news_feed_tags, :feed_id
    add_index :news_feed_tags, :tag_id
  end
end
