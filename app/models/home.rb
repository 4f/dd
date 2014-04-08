class Home < ActiveRecord::Base
  attr_accessible :title, :date, :preText, :title2, :postText, :year_id, :announcement
  translates :title, :preText, :title2, :postText, :announcement

  def date_or_text
    announcement.blank? ? date.strftime('%d.%m.%Y') : announcement
  end

end
