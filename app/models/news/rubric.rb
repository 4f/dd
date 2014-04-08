#encoding: UTF-8
class News::Rubric < ActiveRecord::Base
  attr_accessible :name, uniq: true
  translates :name
  
  has_many :feed_rubrics, dependent: :destroy
  has_many :feeds, through: :feed_rubrics
  #has_and_belongs_to_many :feeds#, dependent: :destroy
  default_scope order('name ASC')

  validates :name, presence: { message: "Ошибка, пустая строка"}
end
