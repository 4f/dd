#encoding: UTF-8
class Video < ActiveRecord::Base
  belongs_to :concert
  has_many :carousels, dependent: :destroy
  attr_accessible :foto, :link, :title
  translates :title
  has_attached_file :foto, styles: {original: "433x350>", sm: "64x64>", carousel: "280x247"} #280x247

  validates :link, presence: { message: 'Ссылка обязательна' }

  before_save :check_link 

  def url(arg = :original)
    foto.url(arg)
  end

  def year_title
    concert.year.to_s + ' ' + title
  end
  
  def check_link  #add http to link if not
    return self.link = '' if self.link.size < 3
    self.link = 'http://' + self.link unless self.link.match( /\Ahttp[s]?:\/\// )
  end


end
