#encoding: UTF-8
class PartnersController < ApplicationController
  before_filter :signed_in_user

  def index
    @concert = Concert.find(params[:concert_id])
    @partners = @concert.partners.all
  end

  def show
    @concert = Concert.find(params[:concert_id])
    @partner = @concert.partners.find(params[:id])
  end

  def new
    @concert = Concert.find(params[:concert_id])
    @partner = @concert.partners.build

  end

  def edit
    @concert = Concert.find(params[:concert_id])
    @partner = Partner.find(params[:id])
   
  end

  def create
    @concert = Concert.find(params[:concert_id])
    @partner = @concert.partners.build(params[:partner])
    if ( params.key? 'cancel' )
      redirect_to new_concert_partner_path(@concert, @partner), notice: 'Данные сброшены'
    else
      if @partner.save
        redirect_to concert_partner_path(@concert, @partner), notice: 'Партнер успешно создан' 
      else
        render action: "new"
      end
    end
  end

  def global
    params[:partners].each do |k, v|
      pp = Partner.find(k)
      pp.global = v
      pp.save
    end
    redirect_to concert_partners_path(params[:concert_id]), notice: 'Обновлено назначение'
    
  end
  

  def update
    @concert = Concert.find(params[:concert_id])
    @partner = Partner.find(params[:id])
    
    if ( params.key? 'cancel' )
      redirect_to edit_concert_partner_path(@concert,@partner), notice: 'Данные сброшены до предыдущих'
    else
      if @partner.update_attributes(params[:partner])
        redirect_to [@concert, @partner], notice: 'Партнер успешно обновлен'
      else
        render action: "edit"
      end
    end
  end

  def destroy
    @concert = Concert.find(params[:concert_id])
    @partner = Partner.find(params[:id])

    redirect_to concert_partners_url, notice: "Партнер #{@partner.destroy.name} удален ("
  end
end
