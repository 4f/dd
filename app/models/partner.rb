#encoding: UTF-8
class Partner < ActiveRecord::Base
  
  attr_accessible :global, :logo, :link, :name, :text, :concert_id
  translates :logo, :name, :text
  has_attached_file :logo, styles: lambda{ |i| i.instance.styles }#{ original: '209x89>' }#, default_style: :s
  #before_post_process :resize_images
  before_save :check_link

  before_post_process :skip_for_not_image
  
  validates_attachment_content_type :logo, :content_type => ['image/png', 'image/jpg', 'image/jpeg', 'image/bmp'], message: 'Непозволительный формат лого'
  validate :logo_or_text


  belongs_to :concert


  def skip_for_not_image
    logger.debug "hi everybody #{logo_content_type.include? 'image'}"
    logo_content_type.include? 'image'
  end

  def styles
    #debugger
    t = logo.queued_for_write[:original]
     if t
       g = Paperclip::Geometry.from_file(t)
       return {sm: '128x32>'} if g.width < 203 && g.height < 86
     end
    {sm: '128x32>', original: '202x85>'}
  end

  private

  def logo_or_text
    errors.add(:logo, 'Было бы неплохо присутствие Лого или Текста') if !logo.queued_for_write[:original] && !logo.exists? && text.blank?
  end
  
  def check_link  #add http to link if not
    return self.link = '' if self.link.size < 3
    self.link = 'http://' + self.link unless self.link.match( /\Ahttp[s]?:\/\// )
  end

end
