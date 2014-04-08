#encoding: UTF-8
class CarouselsController < ApplicationController
  before_filter :signed_in_user

  # layout 'dd', only: [:gallery, :show]

  def index
    @concert = Concert.find params[:concert_id]
    @videos = @concert.videos
    @alboms = @concert.alboms.includes(:fotos)
  end

  
  def show
    # @carousel = carousel.find(params[:id])
  end

  def new
    @concert = Concert.find params[:concert_id]
    @alboms = @concert.alboms.includes(:fotos)
    @videos = @concert.videos
    @carousel = Concert.find(params[:concert_id]).carousels.build
  end

  def edit
    @concert = Concert.find params[:concert_id]
    @alboms = @concert.alboms.includes(:fotos)
    @videos = @concert.videos
    @carousel = Concert.find(params[:concert_id]).carousels.build
  end

  def create
    @concert = Concert.find params[:concert_id]
    @alboms = @concert.alboms.includes(:fotos)
    @videos = @concert.videos
    @carousel = Concert.find(params[:concert_id]).carousels.build
    @concert.carousels.where(params[:carousel]).create( params[:new] )
    @concert.carousels.delete( Carousel.find params[:del] ) if params[:del]

    redirect_to concert_carousels_path(@concert, params[:carousel]), notice: 'Карусел успешно обновлен'

    rescue
      redirect_to concert_carousels_path(@concert, params[:carousel]), notice: 'Что-то пошло не так гладко'
  end

  def update

  end

  def destroy

  end
end
