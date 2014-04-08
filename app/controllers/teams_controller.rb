# encoding: UTF-8
class TeamsController < ApplicationController
  before_filter :signed_in_user
  
  def new
    @team = Team.new
  end

  def index
    @teams = Team.all
  end
  
  def edit
    @team = Team.find(params[:id])
  end

  def show
    @team = Team.find(params[:id])
  end

  def create
    #debugger
    @team = Team.new(params[:team])

    if @team.save
      redirect_to :teams, notice: 'Успешное создание'
    else
      render action: "new"
    end
  end

  def update
    @team = Team.find(params[:id])

    if @team.update_attributes(params[:team])
      redirect_to :teams, notice: 'Успешное обновление' 
    else
      render action: "edit" 
    end
  end

  def destroy
    @team = Team.find(params[:id])
    redirect_to :teams, notice: "Удален #{@team.destroy.name}"
  end
end
