#encoding: UTF-8
class MembersPageController < ApplicationController
  before_filter :signed_in_user,  except: [:page, :show]

  layout 'dd', only: [:show, :page]

  def edit
    @members_page = Concert.find(params[:concert_id]).members_page
  end

  def show #user
    @concert = Concert.last_not_annoucement params[:concert_id]
    @center = params[:center].blank? ? @concert : Concert.find(params[:center])
    @members_page = @concert.members_page
    @url_to_edit = edit_concert_members_page_path(@concert, @concert.members_page)
  end

  def page #user 
    # debugger
    @concert = Concert.find(params[:concert_id].blank? ? 1 : params[:concert_id])
    @center = params[:center].blank? ? @concert : Concert.find(params[:center])
    @members_page = @concert.members_page
    @url_to_edit = edit_concert_members_page_path(@concert, @concert.members_page)

    respond_to do |f|
      f.html {render 'show'}
      f.js
    end
  end
  

  def update    
    @members_page = MembersPage.find(params[:id])
    if @members_page.update_attributes(params[:members_page])
      flash[:notice] = 'Данные успешно обновлены'
      redirect_to action: 'edit'
    else
      flash[:notice] = 'Что-то пошло не так'
      render action: "edit"
    end
  end

end
