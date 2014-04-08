#encoding: UTF-8
class Flag < ActiveRecord::Base
  attr_accessible :image, :country
  translates :country
  
  has_attached_file :image, styles: {original: '21x13'}
  validates_attachment_content_type :image, :content_type => ['image/png', 'image/jpg', 'image/jpeg', 'image/bmp'], message: 'Непозволительный формат лого'
  validates :image, attachment_presence: { message: 'Необходимо загрузить фото'}
  validates :country, presence: {message: 'Страна ?'}

  has_many :members

  before_destroy :have_any_members?

  def updates_by_hash_ids(h)  #return errors
    return 0 if h.nil? || !h.key?('id')
    h[:id].each do |k, v|
      f = Flag.find_by_id k
      f.assign_attributes(v)
      errors.add(*f.errors.first) unless f.save #add to instance error
    end
  end

  private

  def have_any_members?
    errors.add(:base, "#{country} не удалено, есть зависимости") if members.any?
    errors.blank?
  end

end
