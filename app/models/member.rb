#encoding: UTF-8
class Member < ActiveRecord::Base
  belongs_to :concert
  belongs_to :flag
  attr_accessible :city, :flag_id, :foto, :link, :name, :remark, :role
  translates :city, :name, :remark

  has_attached_file :foto, styles: lambda{ |i| i.instance.styles }
  before_save :check_link
  default_scope order: 'members.role ASC'

  validates :name, presence: { message: 'Не указано имя' }
  validates :city, presence: { message: 'Не указан город' }
  validates :flag_id, presence: { message: 'Не указана страна '}
  validates :role, inclusion: { in: [1, 2, 3], message: 'Неправильный тип участника'}

  validates_attachment_content_type :foto, :content_type => ['image/png', 'image/jpg', 'image/jpeg', 'image/bmp'], message: 'Непозволительный формат лого'
  validates :foto, attachment_presence: { message: 'Необходимо загрузить фото'}

  
  def styles
    role == 1 ? {sm: '32x32#', original: '240x240#'} : {sm: '32x32#', original: '200x200#'}
  end

  private


  def check_link  #add http to link if not
    return self.link = '' if self.link.size < 3
    self.link = 'http://' + self.link unless self.link.match( /\Ahttp[s]?:\/\// )
  end

end
