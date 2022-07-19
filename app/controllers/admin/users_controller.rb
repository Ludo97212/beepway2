class Admin::UsersController < ApplicationController
  before_action :check_if_admin

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
      flash.notice = 'Utilisateur créé'
    else
      flash.now.alert = 'Erreur! Essayez à nouveau'
      render :new
    end
  end

  def index
    @users = User.all.order(nom: :asc)
  end


  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
      flash.notice = 'Modifications enregistrées'
    else
      flash.now.alert = 'Erreur! Essayez à nouveau'
      render :edit
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:genre, :nom, :prenom, :email, :password,
                                  :date_naissance, :adresse, :code_postal, :ville, :telephone,
                                  :statut, :url_avatar, :date_update)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def check_if_admin
    # redirect_to root_path unless current_user.admin == true
    if current_user.admin != true
      redirect_to root_path
      flash.notice = "Vous n'êtes pas autorisé"
    end
  end
end
