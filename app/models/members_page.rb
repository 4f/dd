#encoding: UTF-8
class MembersPage < ActiveRecord::Base
  attr_accessible :text_guest, :text_lead, :text_member
  translates :text_guest, :text_lead, :text_member
  has_one :concert
  validates :text_guest, :text_lead, :text_member, presence: {message: "Недопустимо пустое поле текста"}
end
