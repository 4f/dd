class News::FeedRubric < ActiveRecord::Base
  belongs_to :feed
  belongs_to :rubric
  # attr_accessible :title, :body

  validates :feed, presence: true
  validates :rubric, presence: true

end
