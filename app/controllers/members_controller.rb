#encoding: UTF-8
class MembersController < ApplicationController
  before_filter :signed_in_user
  
  def index
    #debugger
    @concert = Concert.find params[:concert_id]
    @members = @concert.members

  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @concert = Concert.find(params[:concert_id])
    @member = @concert.members.build

    respond_to do |format|
      format.html 
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def create

    @member = Concert.find(params[:concert_id]).members.build(params[:member])
    if ( params.key? 'cancel' )
      redirect_to new_concert_member_path(@member.concert, @member), notice: 'Данные сброшены до предыдущих'
    else
      if @member.save
        redirect_to [@member.concert, @member], notice: 'Участник успешно создан'
      else
        render action: "new"
      end
    end
  end

  
  def update
    #debugger
    @member = Member.find(params[:id])
    if ( params.key? 'cancel' )
      redirect_to edit_concert_member_path(@member.concert, @member), notice: 'Данные сброшены до предыдущих'
    else
      if @member.update_attributes(params[:member])
        redirect_to [@member.concert, @member], notice: 'Обновление прошло успешно'
      else
        render action: "edit"
      end
    end
  end

  
  def destroy
    @member = Member.find(params[:id])
    redirect_to concert_members_url, notice: "Участник #{@member.destroy.name} удален ("
  end
end
