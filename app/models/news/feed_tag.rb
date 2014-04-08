class News::FeedTag < ActiveRecord::Base
  #attr_accessible :feed_id, :tag_id
  belongs_to :feed
  belongs_to :tag

  validates :feed, presence: true
  validates :tag, presence: true
end
