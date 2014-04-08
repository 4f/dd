class Contact < ActiveRecord::Base
  attr_accessible :text, :multi
  translates :text

  before_save :check_link

    SOCIAL = %w{ vk facebook twitter g-plus linkedin odnoklassniki forum-od }


  def check_link  #add http to link if not
    return true if multi != 5
    return self.text = '' if self.text.size < 3
    self.text = 'http://' + self.text unless self.text.match( /\Ahttp[s]?:\/\// )
  end


  def self.find_or_create_return_text id
    if Contact.exists?(id) 
      Contact.find(id).text
    else
      t = Contact.new
      t.id = id
      t.save
      ""
    end
  end
end
