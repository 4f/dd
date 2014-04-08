class AddColumnFotoToNewsFeed < ActiveRecord::Migration
  def self.up
    add_attachment :news_feeds, :foto
  end

  def self.down
    remove_attachment :news_feeds, :foto
  end
end
