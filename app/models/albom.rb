#encoding: UTF-8
class Albom < ActiveRecord::Base

  attr_accessible :fotos_attributes, :fototitle
  attr_accessible :text, :title, :tumba, :mainfoto
  translates :text, :title, :tumba
  belongs_to :concert
  has_many :fotos, dependent: :destroy
  has_attached_file :fototitle, styles: {original: "433x350>", gallery: "280x247>", sm: "64x64>"}, default_style: :gallery #280x247
  validates :text, presence: { message: 'Отсутствует текстовая часть' }
  validates :title, presence: { message: 'Отсутствует заглавие' }
  validates :tumba, presence: { message: 'Отсутствует тумба' }

  accepts_nested_attributes_for :fotos
  default_scope order('id DESC')


  def url(arg = :original)
    fototitle.url(arg)
  end

  def year_title
    concert.year.to_s + ' ' + title
  end

  def next
    if concert.alboms.first == self
      concert.alboms.last
    else
      concert.alboms.where('id > ?', id).last
    end
  end

  def prev
    if concert.alboms.last == self
      concert.alboms.first
    else
      concert.alboms.where('id < ?', id).first
    end
  end


  def fotos_attributes=(att)
  	# debugger
    att.each do |i|
    	fotos.build(image: i)
    end
  end

end
