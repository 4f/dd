#encoding: UTF-8
class FlagsController < ApplicationController
  before_filter :signed_in_user
  
  
  def index
    @flags = Flag.all
    @error = Flag.new
  end

  def create
    @flags = Flag.all
    @error = Flag.new
    @error.updates_by_hash_ids(params[:flags])
    params[:id].each do |k, v|
      if k == '0'
        v.each do |a|
          if a[:country].blank? || a[:image].blank?
            @error.errors.add(:base, 'Отсутствует страна или флаг')
          else
            Flag.create(a)
          end
        end
      else
        if v[:del] == "1"
          f = Flag.find(k)
          f.destroy
          @error.errors.add(*f.errors.first) if f.errors.any? 
        end
      end
    end

    if @error.errors.blank?
      redirect_to flags_path, notice: 'Пожалуйста'
    else
      render 'index'
    end
  end

end 
