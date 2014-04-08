class ApplicationController < ActionController::Base
  before_filter :set_locale, :check_browser
  include SimpleCaptcha::ControllerHelpers
  protect_from_forgery
  include UsersHelper




  private

  def default_url_options
    {locale: I18n.locale}
  end

  def set_locale
    # debugger
    logger.debug "session #{session[:locale]}"
    I18n.locale = params[:locale] || session[:locale] || locale_from_browser || I18n.default_locale

    session[:locale] = I18n.locale
    logger.debug "Session #{session[:locale]}"
    #I18n.locale = :ru

  end

  def locale_from_browser
    ar_accept_lang = env["HTTP_ACCEPT_LANGUAGE"].split(",").inject({}) do |s, l|
      l += ';q=1.0' unless l =~ /;q=\d+(?:\.\d+)?$/
      s.merge(Hash[[l.split(';q=')]])
    end

    result =%w{ru be uk ky ab mo et lv}.inject(0.0){ |s, i| s + ar_accept_lang[i].to_f }

    logger.debug "bingo #{result}"
    logger.debug "h0 #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    logger.debug "h2 #{ar_accept_lang}"

    result > 0.5 ? :ru : :en
  end

  def browser_compatible
    r = request.env['HTTP_USER_AGENT']
    if r =~ /Safari/
      unless r =~ /Chrome/
        return r.split('Version/')[1].split(' ').first.split('.').first.to_i > 5
      else
        return r.split('Chrome/')[1].split(' ').first.split('.').first.to_i > 10
      end
    elsif r =~ /Firefox/
      return r.split('Firefox/')[1].split('.').first.to_i > 5
    elsif r =~ /Opera/
      return r.split('Version/')[1].split('.').first.to_i > 11
    elsif r =~ /MSIE/
      return r.split('MSIE')[1].split(' ').first.to_i > 9
    end
    true
  end

  def check_browser
    # debugger
    unless params[:controller] == 'pages' && params[:action] == 'browser_detect'
      # redirect_to browser_detect_path if browser_detection
      redirect_to browser_detect_path unless browser_compatible
    end
  end



end
