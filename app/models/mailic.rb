class Mailic < ActiveRecord::Base
  attr_accessor :bt_flag
  attr_accessible :age, :email, :name, :phone, :text, :tipo, :ip
  attr_accessible :bt_flag
  default_scope order('created_at DESC')

  apply_simple_captcha
end
