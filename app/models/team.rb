# encoding: UTF-8
class Team < ActiveRecord::Base
  attr_accessible :foto, :name, :remark
  translates :name, :remark

  has_attached_file :foto, styles: {original: '200x200#', sm: '50x50#'}

  validates_attachment_content_type :foto, :content_type => ['image/png', 'image/jpg', 'image/jpeg', 'image/bmp']
  validates_attachment_presence :foto, message: "Отсутствует фотография"
  validates :name, presence: { message: "Отсутствует имя"}

end
