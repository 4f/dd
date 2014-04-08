#encoding: UTF-8
class HelpPage < ActiveRecord::Base
	self.set_table_name "help_page"
	attr_accessible :req, :text, :title
  translates :req, :text, :title

	validates :req, presence: { message: "Не заполненны реквизиты" }
	validates :text, presence: { message: "Не заполнен текст страницы" }
	validates :title, presence: { message: "Не заполнено заглавие" }
end
