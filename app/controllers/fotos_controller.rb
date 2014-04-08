class FotosController < ApplicationController
  before_filter :signed_in_user

  def index
    @fotos = Foto.all
  end

  def show
    @foto = Foto.find(params[:id])
  end

  def new
    @foto = Foto.new
  end

  def edit
    @foto = Foto.find(params[:id])
  end

  def create
    @foto = Foto.new(params[:foto])
  end

  def update
    @foto = Foto.find(params[:id])

    if @foto.update_attributes(params[:foto])
      redirect_to @foto, notice: 'Foto was successfully updated.'
    else
      render action: "edit" 
    end
  end

  def destroy
    @foto = Foto.find(params[:id])
    @foto.destroy
    redirect_to fotos_url 
  end
end
