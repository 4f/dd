# encoding: UTF-8
class ContactsController < ApplicationController
  before_filter :signed_in_user,  except: :index
  
  layout 'dd', only: :index

  def index
    @cnt = []
    @text = Gsetting.contact_text[I18n.locale]
    @teams = Team.all
    @url_to_edit = edit_contacts_path
    0..4.times { |i| @cnt[i] = Contact.where("multi = ?", i) }
  end

  
  def edit
    #debugger
    @contact_text = ['ПРИХОДИТЕ', 'ЗВОНИТЕ', 'ОТПРАВЛЯЙТЕ', 'ПИШИТЕ']
    @cnt = []
    @text = Gsetting.contact_text[I18n.locale] || 'hru'
    @emails = Gsetting.contact_emails || 'darydobromiru@gmail.com'
    0..4.times { |i| @cnt[i] = Contact.where("multi = ?", i) }
  end

  def create  #update in one case
    if ( params.key? 'cancel' )
      redirect_to edit_contacts_path, notice: 'Данные сброшены'
    else
      params[:c][:id].each do |k, v|
        if k == '0'
          v.each do |a|
            Contact.create(a) unless a[:text].blank? || a[:multi].blank?
          end
        else
          if v.key? 'del'
            Contact.find(k).destroy
          else
            Contact.find(k).update_attributes v
          end
        end
      end
      flash[:notice] = 'Данные обновились'

      if params.key?(:text) && !params[:text].blank?
        Gsetting.contact_text = Gsetting.contact_text.merge(I18n.locale => params[:text])
      else
        flash[:notice] = 'Текст не обновился'
      end

      if params.key?(:emails) && !params[:emails].blank?
        Gsetting.contact_emails = params[:emails]
      else
        flash[:notice] = 'Почта рассылки не обновилась'
      end

      redirect_to edit_contacts_path
    end
  end

end 
