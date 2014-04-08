#encoding: UTF-8
class Carousel < ActiveRecord::Base
  belongs_to :concert
  belongs_to :foto
  belongs_to :video

  NUMBER = %w{ незвестна заглавная второстепенная }

  attr_accessible :number, :show_index, :foto_id, :video_id

  default_scope order('show_index ASC')
  scope :firstCarousel, where('number = 1').order('show_index ASC')
  scope :secondCarousel, where('number = 2').order('show_index ASC')


  def url (arg = nil)
    foto_id ? foto.image.url(arg) : video_id ? video.foto.url(arg) : nil
  end

  def video_or_foto s1, s2 = ''
    video_id ? s1 : s2    
  end
  
end
