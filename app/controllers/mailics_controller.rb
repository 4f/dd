#encoding: UTF-8
class MailicsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :show, :destroy]


  def volunteer
    params[:volunteer][:tipo] = 0 unless params[:volunteer][:bt_flag].blank? #TIPO for spam
    if simple_captcha_valid?
      m = Mailic.new(params[:volunteer].merge(ip: request.remote_ip))
      logger.fatal 'Dont save mail' unless m.save
    else
      @error = 'Не пройдена авторизация, повторите попытку'
      Gsetting.mail_not_captchas = (Gsetting.mail_not_captchas || 0) + 1;
    end
    if @error.blank?
      if params[:volunteer][:tipo] != 0
        Pochta.volunteer(m).deliver
        Gsetting.mail_volunteers = (Gsetting.mail_volunteers || 0) + 1;
      else
        Gsetting.mail_spams = (Gsetting.mail_spams || 0) + 1;
      end
      render :nothing => true, :status => :ok
    else
      respond_to do |f|
        f.js
      end
    end
  end

  def show
    @mail = Mailic.find params[:id]
  end

  def captcha
    render inline: "<%= show_simple_captcha input_html: {class: 'captcha-enter', required: nil}, placeholder: '' %>"
  end
  

  def index
    @mails = Mailic.page(params[:p]).per(99)
  end

  def callback
    params[:callback][:tipo] = 0 unless params[:callback][:bt_flag].blank?
    if simple_captcha_valid?
      m = Mailic.new(params[:callback].merge(ip: request.remote_ip))
      logger.fatal 'Dont save mail' unless m.save
    else
      @error = 'Не пройдена авторизация, повторите попытку'
      Gsetting.mail_not_captchas = (Gsetting.mail_not_captchas || 0) + 1;
    end
    if @error.blank?
      if params[:callback][:tipo] != 0
        Pochta.callback(m).deliver
        Gsetting.mail_callbacks = (Gsetting.mail_callbacks || 0) + 1;
      else
        Gsetting.mail_spams = (Gsetting.mail_spams || 0) + 1;
      end
      render :nothing => true, :status => :ok
    else
      respond_to do |f|
        f.js
      end
    end
  end

  def destroy
    @mail = Mailic.find(params[:id])
    redirect_to :mailic_index, notice: "Письмо от #{@mail.destroy.name} удалено"
  end

end
