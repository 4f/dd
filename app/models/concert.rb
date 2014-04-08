#endcoding: UTF-8
class Concert < ActiveRecord::Base
  attr_accessible :text1, :text2, :text3, :title, :year, :title2, :home_pre, :home_after
  translates :text1, :text2, :text3, :title, :title2, :home_pre, :home_after

  validates :year, presence: {message: 'Не указан год'}, uniqueness: {message: 'Год не уникален'},
    numericality: {greater_than: 1994, less_than: 2050, message: 'Год неадекватный какой-то'}
  validates :title, presence: {message: 'Отсутствует заглавие'}

  default_scope order('year DESC')

  has_many :partners, dependent: :destroy
  belongs_to :members_page, dependent: :destroy
  has_many :alboms, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :fotos, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :carousels, dependent: :destroy

  

  def self.find_announcement_year (id = nil)
    ( id && find_by_id(id) ) || ( Home.any? && find_by_id( Home.first.year_id) ) || first
  end

  def self.last_not_annoucement(id = nil)
    find id
  rescue
    Home.any? ? where('id != ?', Home.first.year_id).first : first

  end
  

  def crsl (number)
    carousels.includes(:foto, :video).where('number = ?', number)
  end

  def next
    if Concert.first == self
      Concert.last
    else
      Concert.where('year > ?', year).last
    end
  end

  def prev
    if Concert.last == self
      Concert.first
    else
      Concert.where('year < ?', year).first
    end

  end

end
