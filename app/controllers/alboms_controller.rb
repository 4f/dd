#encoding: UTF-8
class AlbomsController < ApplicationController
  before_filter :signed_in_user,  except: [:gallery, :show]


  layout 'dd', only: [:gallery, :show]

  def index
    @concert = Concert.find params[:concert_id]
    @alboms = @concert.alboms
  end

  def gallery #main link in home
    @concert = Concert.last_not_annoucement params[:concert_id]
    @center = params[:center].blank? ? @concert : Concert.find(params[:center])
    @alboms = @concert.alboms
    @videos = @concert.videos
    @url_to_edit = concert_alboms_path(@concert)
    respond_to do |f|
      f.html
      f.js {}
    end
  end
  
  def show
    @albom = Albom.find(params[:id])
    @url_to_edit = edit_concert_albom_path

  end

  def new
    #debugger
    @albom = Concert.find(params[:concert_id]).alboms.build

  end

  def edit
    @albom = Albom.find(params[:id])
  end

  def create
     # debugger

    @albom = Concert.find(params[:concert_id]).alboms.build(params[:albom])

    if @albom.save
      redirect_to edit_concert_albom_path(@albom.concert, @albom), notice: 'Альбом успешно создан'
    else
      render action: "new"
    end
  end

  def update
    notice = nil
    @albom = Albom.find(params[:id])
    if params.key? 'ChooseImage'
      if params.key?(:albom) && params[:albom].key?(:dels_attributes)
        #debugger
        @albom.mainfoto = params[:albom][:dels_attributes].first
        debugger
        @albom.fototitle = @albom.fotos.find(@albom.mainfoto).image
        notice = "Выбрана обложка #{@albom.fotos.find(@albom.mainfoto).image_file_name}" if @albom.save
      else
        notice = "Не выбрано ни одно фото"
      end
    elsif params.key? 'UploadImage'
      if params.key?(:albom) && params[:albom].key?(:fotos_attributes)
        params[:albom][:fotos_attributes].each{ |i| @albom.fotos.build(image: i) }
        notice = "Фото подгружены, (#{params[:albom][:fotos_attributes].size} шт.)" if @albom.save
      else
        notice = "Ничего не подгружено"
      end
    elsif params.key? 'DeleteImage'
      if params.key?(:albom) && params[:albom].key?(:dels_attributes)
        params[:albom][:dels_attributes].each{ |i| Foto.find(i).destroy }
        notice = "Фото удалены (#{params[:albom][:dels_attributes].size} шт.)"
      else
        notice = "Ничего не удалено"
      end
    elsif params.key? 'UploadText'
      notice = 'Альбом успешно обновлен' if @albom.update_attributes(params[:albom])
    end

    if notice
      redirect_to edit_concert_albom_path(@albom.concert, @albom), notice: notice
    else
      render action: "edit"
    end
  end

  def destroy
    @albom = Albom.find(params[:id])
    
    redirect_to concert_alboms_url, notice: "Удален #{@albom.destroy.title}"
  end
end
