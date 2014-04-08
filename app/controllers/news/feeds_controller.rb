#encoding: UTF-8
class News::FeedsController < ApplicationController
  before_filter :signed_in_user,  except: [:show, :list]


  layout 'dd', only: [:show, :list]

  def index
    @news = News::Feed.page(params[:p]).per(99)
  end

  def show  #user
    @url_to_edit = edit_news_feed_path
    @news = News::Feed.find(params[:id])
  end

  def list  #user
    # debugger
    @url_to_edit = news_feeds_path
    @news = News::Feed.includes(:tags, :rubric)
    if params[:t]
      @news = @news.joins(:feed_tags).where("tag_id IN (?)", params[:t]).uniq
    else
      params[:t] = []
    end

    if params[:r]
      @news = @news.joins(:feed_rubrics).where("rubric_id IN (?)", params[:r]).uniq
    else
      params[:r] = []
    end
      
    @news = @news.page params[:p]
  end
  

  def new
    @news = News::Feed.new
  end

  def tags
    @tags = News::Tag.all
    @rubric = News::Rubric.all
  end

  def tags_update

    if ( params.key? 'cancel' )
      notice = 'Восстановлены предыдущие данные'
    else
      d = ( params[:tag] || {} ).delete(:del)
      z = ( ( params[:tag] || {} )[:id] || {} ).delete('0')
      News::Tag.destroy(d.keys) unless d.blank?
      News::Tag.create(z) unless z.blank?
      @tags = !params[:tag].blank? ? News::Tag.update(params[:tag][:id].keys, params[:tag][:id].values) : []

      d = ( params[:rubric] || {} ).delete(:del)
      z = ( ( params[:rubric] || {} )[:id] || {} ).delete('0')
      News::Rubric.destroy(d.keys) unless d.blank?
      News::Rubric.create(z) unless z.blank?
      @rubric = !params[:tag].blank? ? News::Rubric.update(params[:rubric][:id].keys, params[:rubric][:id].values) : []
      notice = 'Обновлено'
    end

    # notice ? redirect_to(tags_news_feeds_path, notice: notice) : render(action: "edit")
    redirect_to tags_news_feeds_path(feed: params[:feed]), notice: notice

  end

  def insert_media
    @albom = Albom.find_by_id params[:media][:albom]
    @video = Video.find_by_id params[:media][:video]
    respond_to do |f|
      f.html
      f.js {}
    end
  end
  
  
  def edit
    @news = News::Feed.find(params[:id])
  end

  def create
    if ( params.key? 'cancel' )
      redirect_to :new_news_feed, notice: 'Данные сброшены'
    else
      @news = News::Feed.new(params[:news_feed])
      if @news.save
        redirect_to edit_news_feed_path(@news), notice: 'Новость создана'
      else
        render action: "new"
      end
    end

  end

  def update

    if ( params.key? 'cancel' )
      notice = 'Восстановлены предыдущие данные'
    else
      @news = News::Feed.find(params[:id])
      notice = 'Обновление прошло успешно' if @news.update_attributes(params[:news_feed])
    end

    notice ? redirect_to(edit_news_feed_path, notice: notice) : render(action: "edit")

  end

  def destroy

    @news = News::Feed.find(params[:id])
    @news.destroy

    redirect_to news_feeds_url
  end
end
