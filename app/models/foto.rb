#encoding: UTF-8
class Foto < ActiveRecord::Base
  belongs_to :concert
  belongs_to :albom
  has_many :carousels, dependent: :destroy

  
  attr_accessible :image
  has_attached_file :image, styles: {original: "1280x1024>", sm: "64x64>", gallery: "217x175>", carousel: "280x247"} #280x247 #210x185
  before_post_process :skip_for_not_image
  
  validates_attachment_content_type :image, :content_type => ['image/png', 'image/jpg', 'image/jpeg', 'image/bmp'], message: 'Непозволительный формат лого'


  def skip_for_not_image
    image_content_type.include? 'image'
  end




end
