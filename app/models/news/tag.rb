#encoding: UTF-8
class News::Tag < ActiveRecord::Base
  attr_accessible :name, uniq: true
  translates :name
  
  has_many :feed_tags, dependent: :destroy
  has_many :feeds, through: :feed_tags
  #has_and_belongs_to_many :feeds#, dependent: :destroy
  default_scope order('name ASC')

  validates :name, presence: { message: "Ошибка, пустая строка"}

end
