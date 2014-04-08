#encoding: UTF-8
class ConcertsController < ApplicationController
  before_filter :signed_in_user,  except: :show
  
  layout 'dd', only: :show

  def index
    #debugger
    @concerts = Concert.all

  end

  def alboms
    @concerts = Concert.all
  end

  def members
    @concerts = Concert.all
  end

  def partners
    @concerts = Concert.all
  end

  def show
    @concert = Concert.last_not_annoucement params[:id]
    @partners = @concert.partners
    @center = params[:center].blank? ? @concert : Concert.find(params[:center])
    @url_to_edit = edit_concert_path(@concert)


    respond_to do |f|
      f.html
      f.js {}
    end

  end

  def new
    @concert = Concert.new
  end

  def edit
    @concert = Concert.find(params[:id])
  end

  def create
    if ( params.key? 'cancel' )
      redirect_to new_concert_path, notice: 'Данные сброшены до предыдущих'
    else
      @concert = Concert.new(params[:concert])
      @concert.create_members_page(text_guest: 'Текст 1', text_lead: 'Текст 2', text_member: 'Текст 3')
      if @concert.save
        redirect_to edit_concert_path @concert, notice: 'Концерт удачно создан'
      else
        render action: "new" 
      end
    end
  end


  def update
    #debugger

    @concert = Concert.find(params[:id])
    if ( params.key? 'cancel' )
      redirect_to edit_concert_path, notice: 'Данные сброшены'
    else
      if @concert.update_attributes(params[:concert])
        redirect_to edit_concert_path, notice: 'Концерт удачно обновлен' 
      else
        render action: "edit" 
      end
    end
  end

  def destroy
    @concert = Concert.find(params[:id])
    redirect_to concerts_url, notice: "Концерт #{@concert.destroy.year} удален" 
  end
end
