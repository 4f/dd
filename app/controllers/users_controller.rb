#encoding: UTF-8
class UsersController < ApplicationController
  before_filter :signed_in_user,  only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,    only: [:edit, :update]
  before_filter :admin_user,      only: [:destroy, :create, :new]


  def signin
    @user = User.new
    render layout: false
  end
  

  def check
    u = User.find_by_name(params[:user][:name].downcase)
    if u && u.authenticate(params[:user][:password])
      sign_in u
      redirect_back_or :concerts
    else
      @user = User.new
      @user.errors.add(:base, 'Неправильная пара имя/пароль' )
      render 'signin', layout: false
    end
  end

  def signout
    sign_out
    redirect_to :signin_users
  end


  def destroy
    t = User.find(params[:id]).destroy.name
    redirect_to users_url, notice: "Пользователь #{t} удален"
  end

  def show  
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    if @user.update_attributes(params[:user])
      sign_in @user
      redirect_to @user, notice: "Пользователь #{@user.name} обновлен"
    else
      render 'edit'
    end
  end

  def create
    params[:user][:password]='daridobro'
    @user = User.new(params[:user])
    if @user.save
      redirect_to :users, notice: "#{@user.name} создан"
    else
      render 'new'
    end
  end

  def new
     @user = User.new
  end

  private

  def when_signed
    redirect_to root_path if signed_in?
  end


  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
    
end
