class News::Feed < ActiveRecord::Base
  attr_accessor :new_tag_name, :new_rubric_name
  attr_accessible :author, :date, :preambula, :text, :title, :foto
  translates :author, :preambula, :text, :title
  attr_accessible :new_tag_name, :tag_ids, :new_rubric_name, :rubric_ids

  has_attached_file :foto, styles: {original: "433x350>"} 

  before_save :create_rubric_tag

  has_many :feed_tags, uniq: true
  has_many :tags, through: :feed_tags, dependent: :destroy  
  has_many :feed_rubrics, uniq: true
  has_many :rubric, through: :feed_rubrics, dependent: :destroy
  #has_and_belongs_to_many :tags, uniq: true
  #has_and_belongs_to_many :rubric, uniq: true
  default_scope order('date DESC, id DESC')

  paginates_per 5


  def prev
    if News::Feed.first == self
      News::Feed.last
    else
      News::Feed.where('date > ? OR (date == ? AND id < ?)', date, date, id).last
    end
  end

  def next
    if News::Feed.last == self
      News::Feed.first
    else
      News::Feed.where('date < ? OR (date == ? AND id > ?)', date, date, id).first
    end

  end

  def create_rubric_tag
    
    unless new_tag_name.blank?
      if News::Tag.exists?(name: new_tag_name )
        tags << News::Tag.find_by_name( new_tag_name )
      else
        tags.create(name: new_tag_name)
      end
    end

    unless new_rubric_name.blank?
      if News::Rubric.exists?(name: new_rubric_name )
        rubric << News::Rubric.find_by_name(new_rubric_name )
      else
        rubric.create(name: new_rubric_name)
      end
    end

  end

end
