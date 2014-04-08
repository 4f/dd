#encoding: UTF-8
class PagesController < ApplicationController
  before_filter :signed_in_user,  except: [:home, :help]
  layout 'dd', only: [:home, :help]

  def home
    @home = Home.first || Home.new
    @concert = Concert.find_announcement_year(params.fetch('id', '0'))
    @partners = @concert.partners.where global: true
    @center = params[:center].blank? ? @concert : Concert.find(params[:center])
    @url_to_edit = home_edit_path


    respond_to do |f|
      f.html
      f.js {}
    end
  end

  def translation
     # debugger
     @data_en = (YAML.load_file Rails.root.join('app', 'assets', 'locales', 'en.yml'))['en']
     @data_ru = (YAML.load_file Rails.root.join('app', 'assets', 'locales', 'ru.yml'))['ru']
    # data["Name"] = ABC
    # File.open("path/to/yml_file.yml", 'w') { |f| YAML.dump(data, f) }
  end

  def update_translation
    if params.key? 'cancel'
      notice = 'Данные сброшены'
    else
      notice = 'Что-то не получилось'
      if params['en']
        FileUtils.copy(Rails.root.join('app', 'assets', 'locales', 'en.yml'), Rails.root.join('app', 'assets', 'locales', 'en.yml.back') )
        File.open( Rails.root.join('app', 'assets', 'locales', 'en.yml'), 'wb') { |f| YAML.dump({'en' => params['en']},f ) }
      end
      I18n.reload!
      notice = 'Данные обновлены'
    end
  ensure
    redirect_to :translation, notice: notice
  end


  def browser_detect
    render layout: false
  end

  def home_edit
    @home = Home.first || Home.new
  end

  def help
    @help_page = HelpPage.first || HelpPage.new
    @url_to_edit = help_edit_path
  end

  def help_edit
    @help_page = HelpPage.first || HelpPage.new
  end

  def help_update
    #debugger
    @help_page = HelpPage.first || HelpPage.new
    if ( params.key? 'cancel' )
      redirect_to help_edit_path, notice: 'Данные сброшены'
    else
      if @help_page.update_attributes(params[:help_page])
        redirect_to help_edit_path, notice: 'Данные успешно обновлены'
      else
        render action: "help_edit"
      end
    end
  end

  def home_update
    #debugger
    @home = Home.first || Home.new
    if ( params.key? 'cancel' )
      redirect_to home_edit_path, notice: 'Данные сброшены'
    else
      if @home.update_attributes(params[:home])
        redirect_to home_edit_path, notice: 'Данные успешно обновлены'
      else
        render action: "home_edit"
      end
    end
  end


end
