#endcoding: UTF-8
class VideosController < ApplicationController
  before_filter :signed_in_user
  include ApplicationHelper  
  
  def index

    @concert = Concert.find(params[:concert_id])
    @videos = @concert.videos
  end
  
  def show
    @video = Concert.find(params[:concert_id]).videos.find(params[:id])
  end
  
  def new
    @video = Concert.find(params[:concert_id]).videos.build
  end
  
  def edit
    @video = Concert.find(params[:concert_id]).videos.find(params[:id])
  end

  def create
    @video = Concert.find(params[:concert_id]).videos.build(params[:video])

    if @video.save
      redirect_to concert_videos_path(@video.concert), notice: 'Успешное создание ссылки'
    else
      render action: "new"
    end
  end

  def update
    @video = Concert.find(params[:concert_id]).videos.find(params[:id])

    if @video.update_attributes(params[:video])
      redirect_to concert_videos_path(@video.concert), notice: 'Ссылка успешно обновлена'
    else
      render action: "edit"
    end
  end

  def destroy
    @video = Concert.find(params[:concert_id]).videos.find(params[:id])
    redirect_to concert_videos_url, notice: "Удалена ссылка #{remove_http(@video.destroy.link)}"
  end
end
