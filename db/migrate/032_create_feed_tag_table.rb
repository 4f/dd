class CreateFeedTagTable < ActiveRecord::Migration
  def up
 
    create_table :feeds_tags, id: false do |t|
        t.references :feed
        t.references :tag
    end
    add_index :feeds_tags, [:feed_id, :tag_id]
    add_index :feeds_tags, :feed_id
    add_index :feeds_tags, :tag_id
  end

  def down
    drop_table :feeds_tags
  end
end
