class UsersController < ApplicationController

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
    if current_user.admin == true
      @users = User.all.order(nom: :asc)
    end
  end


  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id]) if @user == current_user || @user.admin == true
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user || @user.admin == true
      if @user.update(user_params)
        redirect_to @user
        flash.notice = 'Modifications enregistrées'
      else
        flash.now.alert = 'Erreur! Essayez à nouveau'
        render :edit
      end
    end
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
end
